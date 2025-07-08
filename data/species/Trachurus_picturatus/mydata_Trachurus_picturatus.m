function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_picturatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_picturatus'; 
metaData.species_en = 'Blue jack mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.1); % K, body temp
metaData.data_0     = { 'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 19];

%% set data
% zero-variate data

data.ab = 19.5;   units.ab = 'd';    label.ab = 'time at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(13.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'GarcPere2015';   
  temp.am = C2K(13.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 125;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^2.97, see F1';
data.Wwi = 1742; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^2.97, see F1';

data.Ri  = 302358/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(13.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL =	[ % time since birth (yr), total length (cm)
    0 12.3
    1 17.3
    2 22.1
    3 24.9
    4 26.8
    5 29.2
    6 31.9
    7 34.1
    8 36.4
    9 38.5
   10 40.3
   11 41.7
   12 44.5
   13 44.4
   14 44.5
   15 48.5
   16 49.7
   17 48.7
   18 49.5];
data.tL(:,1) = 365 * (1.8+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(13.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GarcPere2015';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.comment = comment;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKY'; % Cat of Life
metaData.links.id_ITIS = '168593'; % ITIS
metaData.links.id_EoL = '46578053'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_picturatus'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_picturatus'; % ADW
metaData.links.id_Taxo = '189256'; % Taxonomicon
metaData.links.id_WoRMS = '126821'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-picturatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_picturatus}}';
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
bibkey = 'GarcPere2015'; type = 'article'; bib = [ ...
'doi = {10.1017/S0025315414001751}, ' ...
'author = {Alexandra Garcia and Joa\~{o} G. Pereira and  \^{A}ngela Canha and D\''{a}lia Reis and Hugo Diogo}, ' ... 
'year = {2015}, ' ...
'title = {Life history parameters of blue jack mackerel \emph{Trachurus picturatus} ({T}eleostei: {C}arangidae) from north-east {A}tlantic}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {95(2)}, ' ...
'pages = {401–410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trachurus-picturatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

