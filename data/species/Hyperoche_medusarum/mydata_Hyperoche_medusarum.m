function [data, auxData, metaData, txtData, weights] = mydata_Hyperoche_medusarum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Hyperiidae';
metaData.species    = 'Hyperoche_medusarum'; 
metaData.species_en = 'Big-eye amphipod'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Lt'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2019 05 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 09]; 

%% set data
% zero-variate data

data.ab = 9;   units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'West1976';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3*365;   units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.372*3.085/6.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'West1976';
data.Li  = 1.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Zeid2015';

data.Wwb = 3.9e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Ditt1987';  
  comment.Wwb = 'based on egg diameter of 0.422 mm for Hyperia galba: pi/6*0.0422^3';
data.Wwi = 19.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'Ditt1987','Zeid2015'};  
  comment.Wwi = 'based on size-corrected wet weight of Hyperia galba: (1.5/1.25)^3*11.1';

data.Ri  = 90; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... time since birth (d), head+thorax length (mm)
 2.109	0.604
11.733	0.898
18.983	1.186
24.783	1.396
33.748	1.848
42.712	2.228
49.831	2.372
68.682	3.085];
data.tL(:,2) = data.tL(:,2)  * 0.65/ 3.08; % convert head + thorax in mm length to total length in cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'West1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Feeds on exumbrellae of Hydromedusae of the genera Tiaropsis, Sarsia, Phialidiurn or Polyorchis';
metaData.bibkey.F1 = 'West1976';
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3NQLT'; % Cat of Life
metaData.links.id_ITIS = '95135'; % ITIS
metaData.links.id_EoL = '46521650'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Hyperoche_medusarum'; % ADW
metaData.links.id_Taxo = '418805'; % Taxonomicon
metaData.links.id_WoRMS = '103256'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperiidae}}';
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
bibkey = 'West1976'; type = 'Article'; bib = [ ... 
'author = {H. von Westerhagen}, ' ... 
'year = {1976}, ' ...
'title = {Some aspects of the biology of the hyperiid amphipod \emph{Hyperoche medusarum}}, ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {28}, ' ...
'pages = {43-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeid2015'; type = 'Article'; bib = [ ... 
'doi = {10.11646/zootaxa.3905.2.1}, ' ...
'author = {Zeidler, W.}, ' ... 
'year = {2015}, ' ...
'title = {A review of the hyperiidean amphipod genus \emph{Hyperoche} {B}ovallius, 1887 ({C}rustacea: {A}mphipoda: {H}yperiidea: {H}yperiidae), with the description of a new genus to accommodate \emph{H. shihi} {G}asca, 2005}, ' ...
'journal = {Zootaxa}, ' ...
'volume = {3905}, ' ...
'pages = {151-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ditt1987'; type = 'Article'; bib = [ ... 
'author = {Birgit Dittrich}, ' ... 
'year = {1987}, ' ...
'title = {Postembryonic development of the parasitic amphipod \emph{Hyperia galba}}, ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {41}, ' ...
'pages = {217-232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
