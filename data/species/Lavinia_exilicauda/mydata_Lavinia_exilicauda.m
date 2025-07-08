function [data, auxData, metaData, txtData, weights] = mydata_Lavinia_exilicauda
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Lavinia_exilicauda'; 
metaData.species_en = 'Hitch'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 5.5*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am= 'GearMoyl1980';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty';         bibkey.Lp = 'GearMoyl1980';
data.Li = 36;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Wiki'; 
  
data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm from G. bicolor, now called Siphateles bicolor : pi/6*0.13^3';
data.Wwp = 46.4;   units.Wwp = 'g';  label.Wwp = 'wet weight puberty';         bibkey.Wwp = {'fishbase','GearMoyl1980'};
  comment.Wwp = 'based on 0.00393*Lp^3.13, see F1';
data.Wwi = 292;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weigh';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00393*Li^3.13, see F1';
  
data.R21 = 9000/365; units.R21 = '#/d';  label.R21 = 'reprod rate at SL 21.2 cm';  bibkey.R21 = 'GearMoyl1980';
  temp.R21 = C2K(16); units.temp.R21 = 'K'; label.temp.R21 = 'temperature';
data.R31 = 63000/365; units.R31 = '#/d';  label.R31 = 'reprod rate at SL 31.2 cm';  bibkey.R31 = 'GearMoyl1980';
  temp.R31 = C2K(16); units.temp.R31 = 'K'; label.temp.R31 = 'temperature';
     
% % univariate data
% time-length
data.tL_f = [ ... % days post hatch, fork length (cm)
1	11.0
2	17.6
3	21.3
4	23.4
5	26.4];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
data.tL_f(:,2) = data.tL_f(:,2)/ 0.92; % convert FL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since hatch', 'total length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GearMoyl1980'; 
comment.tL_f = 'Data for females from Clear Lake';
%
data.tL_m = [ ... % days post hatch, total length (cm)
1	10.2
2	16.1
3	19.6
4	20.3
5	20.0];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
data.tL_m(:,2) = data.tL_m(:,2)/ 0.92; % convert FL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since hatch', 'total length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GearMoyl1980'; 
comment.tL_m = 'Data for males from Clear Lake';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00393*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.92*TL, SL = 0.82*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3SNMN'; % Cat of Life
metaData.links.id_ITIS = '163569'; % ITIS
metaData.links.id_EoL = '207642'; % Ency of Life
metaData.links.id_Wiki = 'Lavinia_exilicauda'; % Wikipedia
metaData.links.id_ADW = 'Lavinia_exilicauda'; % ADW
metaData.links.id_Taxo = '178250'; % Taxonomicon
metaData.links.id_WoRMS = '1017386'; % WoRMS
metaData.links.id_fishbase = 'Lavinia-exilicauda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lavinia_exilicauda}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Lavinia-exilicauda.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GearMoyl1980'; type = 'article'; bib = [ ... 
'author = {R. Eugene Geary and Peter B. Moyle}, ' ...
'year = {1980}, ' ...
'title  = {Aspects of the Ecology of the Hitch, \emph{Lavinia exilicauda} ({C}yprinidae), a Persistent Native Cyprinid in {C}lear {L}ake, {C}alifornia}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'pages = {385-390}, ' ...
'volume = {25}'];
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
