function [data, auxData, metaData, txtData, weights] = mydata_Gallus_gallus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Gallus_gallus'; 
metaData.species_en = 'Red junglefowl';

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Paulus Schuckink Kool','Bas Kooijman'};    
metaData.date_subm = [2012 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 10];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2023 06 22];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data

data.ab = 21;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'McGi2011';   
  temp.ab = C2K(37.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Rahn1991';
data.tx = 3;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'besgroup';   
  temp.tx = C2K(41);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'BurtBurt2002: 7 d';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 174.3;  units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'SchuKerj2002';
  temp.tR = C2K(41);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9125;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'EcoIndia';   
  temp.am = C2K(41);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 57;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwb = 26.65; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SchuKerj2002';
data.Wwi = 959.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'SchuKerj2002';
  comment.Wwim = 'ARKive: 485 - 1050 g';
data.Wwim = 1200; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'ARKive';
  comment.Wwim = 'ARKive: 672 - 1450 g';

data.Ri  = 0.0164383;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EcoIndia';   
  temp.Ri = C2K(41);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ...
 1  26.65
10	65.8;
46	387.05;
112	814.25;
200	959.3];  % time since birth (d), wet weight (g)
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SchuKerj2002';
data.tW_m = [ ...
      1     27.9;
      10    74;
      46   444;
      112  996.8;
      200 1119.1];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SchuKerj2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'SchuKerj2002 data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} only';
D2 = 'mod_3: v is reduced';
D3 = 'mod_4: males have equal state variables at b, compared to females';
D4 = 'mod_5: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Facts
F1 = ['Onset of Sexual Maturity in Female Chickens is Genetically Linked to Loci Associated with Fecundity and a Sexual Ornament. ' ...
    'Onset of sexual maturity was ascertained by palpating the cloaca of each female once per week. ' ...
    'The females were considered sexually mature when an approximate 2.5cm gap was observed between the left and right Tuber ischii.'];
metaData.bibkey.F1 = 'WrigRubi2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F72J'; % Cat of Life
metaData.links.id_ITIS = '176086'; % ITIS
metaData.links.id_EoL = '45513816'; % Ency of Life
metaData.links.id_Wiki = 'Gallus_gallus'; % Wikipedia
metaData.links.id_ADW = 'Gallus_gallus'; % ADW
metaData.links.id_Taxo = '53136'; % Taxonomicon
metaData.links.id_WoRMS = '1463738'; % WoRMS
metaData.links.id_avibase = '3749777E14C923E9'; % avibase
metaData.links.id_birdlife = 'red-junglefowl-gallus-gallus'; % birdlife
metaData.links.id_AnAge = 'Gallus_gallus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallus_gallus}}';
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
bibkey = 'WrigRubi2012'; type = 'Article'; bib = [ ... 
'author = {D. Wright and C. Rubin and K. Schutz and S. Kerje and A. Kindmark and H. Brandstrom and L. Andersson and T. Pizzari and P. Jensen }, ' ... 
'year = {2012}, ' ...
'title = {Onset of sexual maturity in female chickens is genetically linked to loci associated with fecundity and a sexual ornament}, ' ...
'journal = {Reprod Domest Anim.}, ' ...
'doi = {10.1111/j.1439-0531.2011.01963.x.}, ' ...  
'volume = {47}, ' ...
'number = {Suppl 1}, '...
'pages = {31--36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles.}, ' ...
'publisher = {Cambridge University Press}, ' ...
'address = {Cambridge}, '...
'pages = {345--360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchuKerj2002'; type = 'Article'; bib = [ ... 
'author = {Sch\"{u}tz, K. and Kerje, S. and Carlborg, \"{O}. and Jacobsson, L. and Andersson, L. and Jensen, P.}, ' ... 
'year = {2002}, ' ...
'title = {{Q}{T}{L} Analysis of a Red Junglefowl - White Leghorn Intercross Reveals Trade-Off in Resource Allocation between Behavior and Production Traits}, ' ...
'journal = {Behavior Genetics}, ' ...
'volume = {32}, ' ...
'pages = {423--433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Weis1958'; type = 'Article'; bib = [ ... 
'author = {Weiss, H.S.}, ' ... 
'year = {1958}, ' ...
'title = {Application to the fowl of the antipyrine dilution technique for the estimation of body composition}, ' ...
'journal = {Poultry Science}, ' ...
'volume = {37}, ' ...
'pages = {484--489}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'besgroup'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.besgroup.org/2013/05/10/fledging-moments-update-on-the-red-junglefowl-chicks/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Gallus_gallus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EcoIndia'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ecoindia.com}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McGi2011'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.peafowlareus.com/hatching_chart.asp}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/red-junglefowl/gallus-gallus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

