function [data, auxData, metaData, txtData, weights] = mydata_Tylochromis_bangwelensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Tylochromis_bangwelensis'; 
metaData.species_en = 'Hump-back bream'; 

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
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 36;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'KahiMude2023';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 35.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01905*Lp^3.08, see F1';
data.Wwi = 1184;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','KahiMude2023'};
  comment.Wwi = 'based on 0.01905*Li^3.08, see F1';

data.Ri  = 3000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 3000 eggs/young per clutch in Hemichromis fasciatus, one clutch per yr';

% uni-variate data

% time-length
data.LL = [ ... % total length at t (cm), total length at t+1 yr (cm)
9.522	16.210
15.957	19.009
18.968	20.875
20.801	23.207
23.165	26.356
26.177	28.455
28.600	31.137
34.152	35.102];
units.LL   = {'cm', 'cm'};  label.LL = {'total length at t','total length at t+1yr'};  
temp.LL    = C2K(28);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'KahiMude2023';
    
%% set weights for all real data
weights = setweights(data, []);
weights.LL = 5 * weights.LL;

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
F1 = 'length-weight: Ww in g = 0.01905*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '59T2N'; % Cat of Life
metaData.links.id_ITIS = '649357'; % ITIS
metaData.links.id_EoL = '988145'; % Ency of Life
metaData.links.id_Wiki = 'Tylochromis'; % Wikipedia
metaData.links.id_ADW = 'Tylochromis_bangwelensis'; % ADW
metaData.links.id_Taxo = '189655'; % Taxonomicon
metaData.links.id_WoRMS = '1016873'; % WoRMS
metaData.links.id_fishbase = 'Tylochromis-bangwelensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tylochromis}}';
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
bibkey = 'KahiMude2023'; type = 'article'; bib = [ ... 
'doi = {10.47772/IJRISS.2023.71045}, ' ...
'author = {Kabundula Kahilu and Hangoma G. Mudenda and Cyprian Katongo}, ' ... 
'year = {2023}, ' ...
'title = {Growth of \emph{Tylochromis bangwelensis} (Hump-Back Bream, {R}egan, 1920) in {B}angweulu Lakes and Swamps Complex Fishery, {Z}ambia}, ' ...
'institution = {International Journal of Research and Innovation in Social Science (IJRISS)}, ' ...
'volume = {7(9)}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tylochromis-bangwelensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

