function [data, auxData, metaData, txtData, weights] = mydata_Cuculus_canorus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cuculiformes'; 
metaData.family     = 'Cuculidae';
metaData.species    = 'Cuculus_canorus'; 
metaData.species_en = 'Common cuckoo'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpo'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 08 20];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 01 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3  = {'Bas Kooijman'};    
metaData.date_mod_3    = [2022 11 21];              
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3 = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 25];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 11.65;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'SnowPerr1998';   
  temp.ab = C2K(36.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from BirkHemm2010';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 57;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'SealWalt1981';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4709;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 33;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'SnowPerr1998';

data.Wwb = 2.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OhmaChap1970';
data.Wwi = 115;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'OhmaChap1970';

data.Ri  = 9.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'SnowPerr1998';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
% Host: White Wagtail (Motacilla alba)
data.tW_Ma = [ ...
3   12.85905372;
4	18.46734553;
5	23.04219248;
6	31.04801262;
7	42.05677824;
9	60.0088439;
11	71.96205107;
13	86.01058857;
15	94.11581039;
16	98.16368803;
17	97.33810374;
18	100.1248148;
19	98.23971415];
units.tW_Ma  = {'d', 'g'};  label.tW_Ma = {'time since birth', 'wet weight', 'host: Motacilla alba'};  
temp.tW_Ma   = C2K(41.3);  units.temp.tW_Ma = 'K'; label.temp.tW_Ma = 'temperature';
bibkey.tW_Ma = 'Wyll1981';
comment.tW_Ma = 'host: Motacilla alba';
%
% Host: Dunnock (Prunella modularis)
data.tW_Pm = [ ...
0   3.625061641;
1	5.438775405;
2	7.531874624;
3	11.42847461;
4	16.47947459;
5	21.22351979;
6	26.92034907;
7	32.95522953;
8	41.25177737;
9	47.89509957;
10	54.44307058;
11	60.25095657;
12	71.17499596;
13	78.58895444;
14	81.1203529;
15	83.62061672;
16	86.51943276;
17	87.44897602;
18	83.09489256;
19	85.20325265;
20	85.17016145];
units.tW_Pm  = {'d', 'g'};  label.tW_Pm = {'time since birth', 'wet weight', 'host: Prunella modularis'};  
temp.tW_Pm   = C2K(41.3);  units.temp.tW_Pm = 'K'; label.temp.tW_Pm = 'temperature';
bibkey.tW_Pm = 'Wyll1981';
comment.tW_Pm = 'host: Prunella modularis';
%
% Host: Reed Warbler (Acrocephalus scirpaceus)
data.tW_As = [ ...
0   3.633238787;
1	6.135898322;
2	8.117523196;
3	12.86710821;
4	19.05357888;
5	23.14650925;
6	29.03264164;
7	37.11533604;
8	40.72064153;
9	47.47153653;
10	57.41515113;
11	67.09947061;
12	63.23362417;
13	68.4997138;
14	72.10262818;
15	71.44378652;
16	72.71429669;
17	70.82300745;
18	75.37796512;
19	69.82695091;
20	82.08176974];
units.tW_As  = {'d', 'g'};  label.tW_As = {'time since birth', 'wet weight', 'host: Acrocephalus scirpaceus'};  
temp.tW_As   = C2K(41.3);  units.temp.tW_As = 'K'; label.temp.tW_As = 'temperature';
bibkey.tW_As = 'Wyll1981';
comment.tW_As = 'host: Acrocephalus scirpaceus';
%
% Host: European Robin (Erithacus rubecula)
data.tW_Er = [ ...
2 8.061560633;
3	11.6545313;
4	16.5561147;
5	21.68371691;
6	31.21900817;
7	37.69420522;
8	45.74563162;
9	54.16384928;
10	62.07710094;
11	69.06074106;
12	72.0592344;
13	78.52687276;
14	81.20565181;
15	89.08789185;
16	95.49578773;
17	100.5552889;
18	99.82368502;
19	107.1314179];
units.tW_Er  = {'d', 'g'};  label.tW_Er = {'time since birth', 'wet weight', 'host: Erithacus rubecula'};  
temp.tW_Er   = C2K(41.3);  units.temp.tW_Er = 'K'; label.temp.tW_Er = 'temperature';
bibkey.tW_Er = 'Wyll1981';
comment.tW_Er = 'host: Erithacus rubecula';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_Er = weights.tW_Er * 2;
weights.tW_As = weights.tW_As * 2;
weights.tW_Pm = weights.tW_Pm * 2;
weights.tW_Ma = weights.tW_Ma * 2;

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
set1 = {'tW_Ma','tW_Pm','tW_As','tW_Er'}; subtitle1 = {'Host: Motacilla, Prunella, Acrocephalus, Erithacus'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_3: v is reduced';
D2 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Brood parasite for small passerines';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BPL3'; % Cat of Life
metaData.links.id_ITIS = '177822'; % ITIS
metaData.links.id_EoL = '45510716'; % Ency of Life
metaData.links.id_Wiki = 'Cuculus_canorus'; % Wikipedia
metaData.links.id_ADW = 'Cuculus_canorus'; % ADW
metaData.links.id_Taxo = '54514'; % Taxonomicon
metaData.links.id_WoRMS = '212682'; % WoRMS
metaData.links.id_avibase = 'B3D2C3C5B73EC8E8'; % avibase
metaData.links.id_birdlife = 'common-cuckoo-cuculus-canorus'; % birdlife
metaData.links.id_AnAge = 'Cuculus_canorus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cuculus_canorus}}';
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
bibkey = 'BirkHemm2010'; type = 'Article'; bib = [ ... 
'author = {Birkhead, T. R. and Hemmings, N. and Spottiswoode, C. N. and Mikulica, O. and Mosk\''{a}t, C. and B\''{a}n, M. and Schulze-Hagen, K.}, ' ... 
'year = {2010}, ' ...
'title = {Internal incubation and early hatching in brood parasitic birds}, ' ...
'journal = {Proceedings of the Royal Society B: Biological Sciences}, ' ...
'volume = {278}, ' ...
'pages = {1019--1024}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OhmaChap1970'; type = 'Article'; bib = [ ... 
'author = {Ohmart, R. D. and Chapman, T. E. and McFarland, L. Z.}, ' ... 
'year = {1970}, ' ...
'title = {Water turnover in Roadrunners under different environmental conditions}, ' ...
'journal = {The Auk}, ' ...
'volume = {87}, ' ...
'pages = {787--793}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SealWalt1981'; type = 'Article'; bib = [ ... 
'author = {Seal, D. C. and Walton, K. C. and Wyllie, I.}, ' ... 
'year = {1981}, ' ...
'title = {Age of first breeding in the Cuckoo.}, ' ...
'journal = {Bird Study}, ' ...
'volume = {28}, ' ...
'pages = {211--214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wyll1981'; type = 'Book'; bib = [ ... 
'author = {Wyllie, I.}, ' ... 
'year = {1981}, ' ...
'title = {The Cuckoo}, ' ...
'publisher = {Batsford}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition.}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
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

