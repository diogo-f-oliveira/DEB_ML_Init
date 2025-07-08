function [data, auxData, metaData, txtData, weights] = mydata_Pseudophycis_bachus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Pseudophycis_bachus'; 
metaData.species_en = 'Red codling'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L_f'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};           
metaData.date_subm = [2017 11 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data;

data.am = 6*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'KempJenk2013';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 31.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'KempJenk2013';
  comment.Lp = 'for Australian waters';
data.Lpm  = 24;   units.Lpm  = 'cm';   label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'KempJenk2013';
  comment.Lpm = 'for Australian waters';
data.Li  = 90;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'unitedfisheries';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp  = 482;   units.Wwp  = 'g';   label.Wwp  = 'wet weight at puberty to females';  bibkey.Wwp  = 'KempJenk2013';
  comment.Wwp = 'based on F2: 2e-6*(10*Lp)^3.355';
data.Wwpm  = 193;   units.Wwpm  = 'g';   label.Wwpm  = 'wet weight at puberty for male';  bibkey.Wwpm  = 'KempJenk2013';
  comment.Wwpm = 'based on F2: 2e-6*(10*Lpm)^3.355';
data.Wwi  = 16.3e3;  units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'unitedfisheries','KempJenk2013'};
 comment.Wwi = 'based on F2: 2e-6*(10*Li)^3.355';

data.Ri = 30e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL_fA = [ ... % time since birth (yr), total length (cm) 
0 25.6
1 33.4
2 48.7];
data.tL_fA(:,1) = (data.tL_fA(:,1) + 0.75) * 365; % convert yr to d
units.tL_fA = {'d', 'cm'};   label.tL_fA = {'time since birth', 'total length', 'female'};  
temp.tL_fA = C2K(18);  units.temp.tL_fA = 'K'; label.temp.tL_fA = 'temperature';
bibkey.tL_fA = 'KempJenk2013';
comment.tL_fA = 'Data for females in Australian waters';
%
data.tL_mA = [ ... % time since birth (yr), total length (cm) 
0 22.4
1 31.5
2 40.3];
data.tL_mA(:,1) = (data.tL_mA(:,1) + 0.75) * 365; % convert yr to d
units.tL_mA = {'d', 'cm'};   label.tL_mA = {'time since birth', 'total length', 'male'};  
temp.tL_mA = C2K(18);  units.temp.tL_mA = 'K'; label.temp.tL_mA = 'temperature';
bibkey.tL_mA = 'KempJenk2013';
comment.tL_mA = 'Data for males in Australian waters';
%
data.tL_fNZ = [ ... % time since birth (yr), total length (cm) 
0 19.1
1 35.3
2 50.2
3 57.7
4 75.4];
data.tL_fNZ(:,1) = (data.tL_fNZ(:,1) + 0.75) * 365; % convert yr to d
units.tL_fNZ = {'d', 'cm'};   label.tL_fNZ = {'time since birth', 'total length', 'female'};  
temp.tL_fNZ = C2K(10);  units.temp.tL_fNZ = 'K'; label.temp.tL_fNZ = 'temperature';
bibkey.tL_fNZ = 'KempJenk2013';
comment.tL_fNZ = 'Data for females in New Zealand waters';
%
data.tL_mNZ = [ ... % time since birth (yr), total length (cm) 
0 17.4
1 33.3
2 48.9
3 53.8
4 62.0];
data.tL_mNZ(:,1) = (data.tL_mNZ(:,1) + 0.75) * 365; % convert yr to d
units.tL_mNZ = {'d', 'cm'};   label.tL_mNZ = {'time since birth', 'total length', 'male'};  
temp.tL_mNZ = C2K(10);  units.temp.tL_mNZ = 'K'; label.temp.tL_mNZ = 'temperature';
bibkey.tL_mNZ = 'KempJenk2013';
comment.tL_mNZ = 'Data for males in New Zealand waters';

%% set weights for all real data
weights = setweights(data, []);
% weights.tL_fA = 3 * weights.tL_fA;
% weights.tL_mA = 3 * weights.tL_mA;
% weights.tL_fNZ = 3 * weights.tL_fNZ;
% weights.tL_mNZ = 3 * weights.tL_mNZ;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fA','tL_mA'}; subtitle1 = {'Data for Australian females, males'};
set2 = {'tL_fNZ','tL_mNZ'}; subtitle2 = {'Data for New Zealand females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Is food source for the yellow-eyed penguin, Megadyptes antipodes and little penguin, Eudyptula minor and Australian fur seal, Arctocephalus pusillus doriferus';
metaData.bibkey.F1 = {'Wiki','KempJenk2013'};
F2 = 'length-weight: Fish weight = 2e-6*(TL in mm)^3.355';
metaData.bibkey.F2 = 'KempJenk2013';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4P7GQ'; % Cat of Life
metaData.links.id_ITIS = '550677'; % ITIS
metaData.links.id_EoL = '46565087'; % Ency of Life
metaData.links.id_Wiki = 'Pseudophycis_bachus'; % Wikipedia
metaData.links.id_ADW = 'Pseudophycis_bachus'; % ADW
metaData.links.id_Taxo = '185269'; % Taxonomicon
metaData.links.id_WoRMS = '282468'; % WoRMS
metaData.links.id_fishbase = 'Pseudophycis-bachus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudophycis_bachus}}';
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
bibkey = 'KempJenk2013'; type = 'Article'; bib = [ ... 
'author = {J. Kemp and G. P. Jenkins and S. E. Swearer}, ' ... 
'year = {2013}, ' ...
'title = {Assessing the intrinsic resilience of a particularly fast-growing teleost prey species (red cod, \emph{Pseudophycis bachus})}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'doi = {10.1071/MF12198}, ' ...
'volume = {64}, ' ...
'pages = {130-138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.org/summary/Pseudophycis-bachus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2231/en}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unitedfisheries'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.unitedfisheries.co.nz/content/red-cod-pseudophycis-bachus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

