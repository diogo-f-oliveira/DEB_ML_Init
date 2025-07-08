function [data, auxData, metaData, txtData, weights] = mydata_Gallus_gallus_WL

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Gallus_gallus_WL'; 
metaData.species_en = 'White leghorn'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Paulus Schuckink Kool','Bas Kooijman'};    
metaData.date_subm = [2012 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 11 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 10];

%% set data
% zero-variate data

data.ab = 21;     units.ab = 'd';    label.ab = 'age at birth';                             bibkey.ab = 'McGi2011';   
  temp.ab = C2K(37.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 6*7;    units.tx = 'd';    label.tx = 'time since birth at fledging';            bibkey.tx = 'besgroup';   
  temp.tx = C2K(41);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value taken from Gallus gallus';
data.tp = 132;    units.tp = 'd';    label.tp = 'time since birth at puberty';              bibkey.tp = 'guess';   
  temp.tp = C2K(41);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tR minus clutch interval';
data.tR = 19.9*7; units.tR = 'd';    label.tR = 'time since birth at 1st brood for females';  bibkey.tR = 'SchuKerj2002';
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.tRm = 90;    units.tRm = 'd';   label.tRm = 'time since birth at 1st brood for males';   bibkey.tRm = 'SchuKerj2002';
  temp.tRm = C2K(41);  units.temp.tRm = 'K'; label.temp.tRm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                                bibkey.am = 'SchuKerj2002';   
  temp.am = C2K(41);  units.temp.am = 'K';   label.temp.am = 'temperature'; 
data.Wwb = 37.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                     bibkey.Wwb = 'SchuKerj2002';
data.WwR = 1629.3;   units.WwR = 'g';      label.WwR = 'wet weight at 1st brood';           bibkey.WwR = 'SchuKerj2002';
data.Wwi = 2500;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';         bibkey.Wwi = 'leghornbreeders';
data.Wwim = 3400;   units.Wwim = 'g';      label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'leghornbreeders';

data.Ri  = 6*52/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                  bibkey.Ri  = 'SchuKerj2002';   
temp.Ri = C2K(41);  units.temp.Ri = 'K';   label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW_f = [ ...
    1  37.2         
   10  81.9        
   46  545.4       
  112 1158.7     
  200 1629.3]; 
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SchuKerj2002';
% 
data.tW_m = [ ...
 1    37.8;         
 10   87.6;        
 46  659.4;       
112 1766.8;     
200 2107.2];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SchuKerj2002';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);  

%% Facts
F1 = 'sexually mature when an approximate 2.5cm gap between the left and right Tuber ischii';
metaData.bibkey.F1 = 'SchuKerj2002'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F72J'; % Cat of Life
metaData.links.id_ITIS = '176086'; % ITIS
metaData.links.id_EoL = '45513816'; % Ency of Life
metaData.links.id_Wiki = 'Gallus_gallus'; % Wikipedia
metaData.links.id_ADW = 'Gallus_gallus'; % ADW
metaData.links.id_Taxo = '53136'; % Taxonomicon
metaData.links.id_avibase = '3749777E14C923E9'; % Avibase
metaData.links.id_birdlife = 'red-junglefowl-gallus-gallus'; % Birdlife
metaData.links.id_AnAge = 'Gallus_gallus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/my_pet}}';
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
bibkey = 'SchuKerj2002'; type = 'Article'; bib = [ ... 
'author = {Sch\"{u}tz, K. and Kerje, S. and Carlborg, \"{O}. and Jacobsson, L. and Andersson, L. and Jensen, P.}, ' ... 
'year = {2002}, ' ...
'title = {{Q}{T}{L} Analysis of a Red Junglefowl x White Leghorn Intercross Reveals Trade-Off in Resource Allocation between Behavior and Production Traits.}, ' ...
'journal = {Behavior Genetics}, ' ...
'volume = {32}, ' ...
'pages = {423--433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'leghornbreeders'; type = 'Misc'; bib = ...
'howpublished = {\url{http://leghornbreeders.webs.com/leghornstandards.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fass'; type = 'Misc'; bib = [ ...
'author = {D. D. Bell and D. R. Kuney}, ' ...
'title  = {Effect of fasting and post-fast diets on performance in molted flocks}, ' ...
'howpublished = {\url{http://japr.fass.org/content/1/2/200.full.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'besgroup'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.besgroup.org/2013/05/10/fledging-moments-update-on-the-red-junglefowl-chicks/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McGi2011'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.peafowlareus.com/hatching_chart.asp}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

