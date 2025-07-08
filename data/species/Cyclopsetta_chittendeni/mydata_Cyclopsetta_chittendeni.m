function [data, auxData, metaData, txtData, weights] = mydata_Cyclopsetta_chittendeni

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cyclopsettidae';
metaData.species    = 'Cyclopsetta_chittendeni'; 
metaData.species_en = 'Mexican flounder'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K

metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data;

data.ab = 9;      units.ab = 'd';      label.ab = 'time at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(24.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';        
data.am = 7*365;       units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lp  = 17;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Vand2000';
data.Li  = 32;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'fishebase';

data.Wwb = 5.24e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Vand2000';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 59.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'Vand2000','fishbase'};
  comment.Wwp = '0.00891*Lp^3.11, see F1';
data.Wwi = 427.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = '0.00891*Li^3.11, see F1';

data.Ri  = 2.1e5/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CengIsme2014';   
 temp.Ri = C2K(24.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = 'based on kap=0.8'; 
  
% uni-variate data

% time-length
data.tL = [ ... % month (#), total length (cm)
 1  5.60
 2  6.46
 3 10.05
 4 12.01
 6 14.79
 8 16.35
 8.01 13.78
 9 15.86
10 14.80
11 15.84
12 18.32
13 19.60
14 20.55
15 21.77
16 22.77
18 24.10
20 25.90];
data.tL(:,1) = (data.tL(:,1)+3)*30.5; % convert mnth to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Daws1968';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C66R'; % Cat of Life
metaData.links.id_ITIS = '616555'; % ITIS
metaData.links.id_EoL = '46569931'; % Ency of Life
metaData.links.id_Wiki = 'Cyclopsetta_chittendeni'; % Wikipedia
metaData.links.id_ADW = 'Cyclopsetta_chittendeni'; % ADW
metaData.links.id_Taxo = '171358'; % Taxonomicon
metaData.links.id_WoRMS = '127130'; % WoRMS
metaData.links.id_fishbase = 'Cyclopsetta-chittendeni'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyclopsetta_chittendeni}}';
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
bibkey = 'Daws1968'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1968)97[504:cttbot]2.0.co;2}, ' ...
'author = {Dawson, C. E.}, ' ...
'year = {1968}, ' ...
'title = {Contributions to the Biology of the {M}exican Flounder, \emph{Cyclopsetta chittendeni}, in the {N}orthern {G}ulf of {M}exico}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {97(4)}, ' ...
'pages = {504–507}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vand2000'; type = 'techreport'; bib = [ ... 
'author = {Steven J. VanderKooy}, ' ...
'year = {2000}, ' ...
'title = {The Flounder Fishery of the {G}ulf of {M}exico, {U}nited {S}tates: {A} Regional Management Plan}, ' ...
'institution = {Gulf States Marine Fisheries Commission}, ' ...
'volume = {83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Cyclopsetta-chittendeni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

