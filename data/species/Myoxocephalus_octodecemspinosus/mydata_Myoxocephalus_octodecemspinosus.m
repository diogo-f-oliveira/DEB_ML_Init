function [data, auxData, metaData, txtData, weights] = mydata_Myoxocephalus_octodecemspinosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Myoxocephalus_octodecemspinosus'; 
metaData.species_en = 'Longhorn sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 15];

%% set data
% zero-variate data

data.am = 11 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(6.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 46;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 7.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.4 mm of Myoxocephalus_scorpius: pi/6*0.24^3';
data.Wwp = 33;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00692*Lp^3.13, see F1';
data.Wwi = 1108;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.13, see F1';

data.Ri = 4e4/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(6.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Myoxocephalus_scorpius';

% uni-variate data
% time-length
data.tL = [ ... % age (yr), total length (cm) 
    1  5.6
    2 17.1
    3 25.4
    4 26.5
    5 27.6
    6 29.1
    7 31.0
    8 30.9
    9 30.9];
data.tL(:,1) =  365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(6.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Morr1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '456LN'; % Cat of Life
metaData.links.id_ITIS = '167320'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myoxocephalus_octodecemspinosus'; % Wikipedia
metaData.links.id_ADW = 'Myoxocephalus_octodecemspinosus'; % ADW
metaData.links.id_Taxo = '180580'; % Taxonomicon
metaData.links.id_WoRMS = '159520'; % WoRMS
metaData.links.id_fishbase = 'Myoxocephalus-octodecemspinosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myoxocephalus_octodecemspinosus}}';
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
bibkey = 'Morr1993'; type = 'Article'; bib = [ ... 
'author = {Morrow, J.}, ' ... 
'year = {1993}, ' ...
'title = {The biology of the longhorn sculpin, \emph{Myoxocephalus octodecimspinosus} {M}itchill, with a discussion of the {S}outhern {N}ew {E}ngland ''trash'' fishery}, ' ...
'journal = {Bull. Bingham Ocean. Coll.}, ' ...
'volume = {13(2)}, ' ...
'pages = {1-89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myoxocephalus_octodecemspinosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

