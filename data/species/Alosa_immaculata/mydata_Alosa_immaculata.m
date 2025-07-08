  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_immaculata

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_immaculata'; 
metaData.species_en = 'Pontic shad'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAbl','THp'};
metaData.ecoCode.habitat = {'jiMpe', 'piFr', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 22];

%% set data
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(13.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 39;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7-2.4 mm of Alosa fallax: pi/6*0.2^3';
data.Wwp = 163.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01318*Lp^2.99, see F1';
data.Wwi = 753.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.99, see F1';
  
data.Ri = 136288/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since 1 jan (d), total length (cm)
365+89.528	12.940
365+273.504	19.004
730+90.020	23.393
730+274.488	27.367
730+334.993	27.576
1095+91.004	27.715
1095+182.008	30.188
1095+273.996	33.360
1095+335.977	33.152
1460+91.496	34.126];
data.tL(:,1) = data.tL(:,1)-150; % SET ORIGIN AT BIRTH
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(13.3);  units.temp.tL = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL = {'Bali2019'}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Ri = weights.Ri * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01318*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'C5M6'; % Cat of Life
metaData.links.id_ITIS = '161716'; % ITIS
metaData.links.id_EoL = '46562370'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_fallax'; % Wikipedia
metaData.links.id_ADW = 'Alosa_fallax'; % ADW
metaData.links.id_Taxo = '42628'; % Taxonomicon
metaData.links.id_WoRMS = '126415'; % WoRMS
metaData.links.id_fishbase = 'Alosa-fallax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_fallax}}';  
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
bibkey = 'Bali2019'; type = 'article'; bib = [ ... 
'doi = {10.12714/egejfas.36.4.01}, ' ...
'author = {Ismet Bal{\i}k}, '...
'year = {2019}, ' ...
'title = {Population parameters of the pontic shad, \emph{Alosa immaculata} {B}ennett, 1835 in the {F}atsa coast of the south-eastern {B}lack {S}ea}, ' ...
'journal = {Ege Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {36(4)}, ' ...
'pages = {319-324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Alosa-fallax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  