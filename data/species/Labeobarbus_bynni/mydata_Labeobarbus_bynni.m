  function [data, auxData, metaData, txtData, weights] = mydata_Labeobarbus_bynni

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = ''; 
metaData.species_en = 'Niger Labeobarbus_bynnibarb'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 08];

%% set data
% zero-variate data
data.ab = 7.5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Barbus barbus';
data.Li = 82;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm of Barbus barbus: pi/6*0.125^3';
data.Wwp = 150.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00933*Lp^3.01, see F1';
data.Wwi = 5.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.01, see F1';
   
data.Ri = 140e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.9';
   
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
74.251	8.905
104.485	8.934
135.095	11.303
165.323	11.512
226.134	15.169
256.814	14.840
289.182	17.030
318.977	17.060
349.196	17.629
365+14.858	18.019
365+47.197	21.288
365+73.935	20.955
365+105.044	20.985
365+134.769	23.713
365+164.630	21.224
365+196.111	23.773
365+227.598	26.142
365+288.451	28.181
365+318.232	28.749
365+349.374	27.521
730+74.127	30.307
730+195.875	32.766];
data.tL(:,1) = 100 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RJ3Y'; % Cat of Life
metaData.links.id_ITIS = '688502'; % ITIS
metaData.links.id_EoL = '52569333'; % Ency of Life
metaData.links.id_Wiki = 'Labeobarbus_bynni'; % Wikipedia
metaData.links.id_ADW = 'Labeobarbus_bynni'; % ADW
metaData.links.id_Taxo = '3416636'; % Taxonomicon
metaData.links.id_WoRMS = '1026004'; % WoRMS
metaData.links.id_fishbase = 'Labeobarbus-bynni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeobarbus_bynni}}';  
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeobarbus-bynni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

