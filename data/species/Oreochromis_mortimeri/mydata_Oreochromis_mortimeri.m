function [data, auxData, metaData, txtData, weights] = mydata_Oreochromis_mortimeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Oreochromis_mortimeri'; 
metaData.species_en = 'Kariba tilapia'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 18];

%% set data
% zero-variate data

data.am = 13*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ChifVide2014';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 48;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 219;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 2293;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';

data.Ri  = 2286/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity 0.0008*Li^3.84 of Oreochromis_karongae';
 
% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1  6.6
    2 19.6
    3 27.6
    4 27.0
    5 26.2
    6 26.7
    7 26.4
    8 28.9
    9 27.8
   10 30.1
   13 30.3];
data.tL(:,1) = 365 * (data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChifVide2014';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ST3D'; % Cat of Life
metaData.links.id_ITIS = '648848'; % ITIS
metaData.links.id_EoL = '218169'; % Ency of Life
metaData.links.id_Wiki = 'Oreochromis_mortimeri'; % Wikipedia
metaData.links.id_ADW = 'Oreochromis_mortimeri'; % ADW
metaData.links.id_Taxo = '182123'; % Taxonomicon
metaData.links.id_WoRMS = '1013438'; % WoRMS
metaData.links.id_fishbase = 'Oreochromis-mortimeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreochromis_mortimeri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChifVide2014'; type = 'article'; bib = [ ... 
'doi = {10.2989/16085914.2014.903375}, ' ...
'author = {P. C.  Chifamba and J. J. Videler}, ' ...
'year  = {2014}, ' ...
'title = {Growth rates of alien \emph{Oreochromis niloticus} and indigenous \emph{Oreochromis mortimeri} in {L}ake {K}ariba, {Z}imbabwe}, ' ... 
'journal = {African Journal of Aquatic Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oreochromis-mortimeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

