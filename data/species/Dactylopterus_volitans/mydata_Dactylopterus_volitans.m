function [data, auxData, metaData, txtData, weights] = mydata_Dactylopterus_volitans
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Dactylopteriformes'; 
metaData.family     = 'Dactylopteridae';
metaData.species    = 'Dactylopterus_volitans'; 
metaData.species_en = 'Flying gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 21];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(23.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(23.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';    bibkey.Lp = 'fishbase';
data.Li = 55;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 78.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00912*Lp^3.05, see F1';
data.Wwi = 1854; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';     bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00912*Li^3.05, see F1';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(23.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (years), total length (cm)
0	5.799
1	12.732
2	20.922
3	26.459
4	30.528];
data.tL(:,1) = 365 * (0.6+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(23.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VazdRoss2019';

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

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.01023*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33WF6'; % Cat of Life
metaData.links.id_ITIS = '167624'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Dactylopterus_volitans'; % Wikipedia
metaData.links.id_ADW = 'Dactylopterus_volitans'; % ADW
metaData.links.id_Taxo = '45024'; % Taxonomicon
metaData.links.id_WoRMS = '127232'; % WoRMS
metaData.links.id_fishbase = 'Dactylopterus-volitans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dactylopterus_volitans}}';
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
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dactylopterus-volitans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

