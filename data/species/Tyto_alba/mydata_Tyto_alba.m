function [data, auxData, metaData, txtData, weights] = mydata_Tyto_alba

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Tytonidae';
metaData.species    = 'Tyto_alba'; 
metaData.species_en = 'Barn owl'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2010 09 16];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 09 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 15];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 04];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 33;   units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'TacuCrai2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Howe1964';  
data.tx = 52.5; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(40.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from Howe1964,Edwar1987,Thou1999';
data.tp = 157.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from Howe1964,Edwar1987,Thou1999';
data.tR = 365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'TacuCrai2013';
  temp.tR = C2K(40.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7775; units.am = 'd';    label.am = 'life span';                  bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 34;  units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'NagaThiy2002';

data.Wwb = 15;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = {'DuraLand2008','TacuCrai2013'};
data.Wwi = 334; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = {'CramSimm2004','DuraLand2008'};

data.Ri = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CramSimm2004';   
  temp.Ri = C2K(40.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge: 2 clutches/yr, 6 eggs/clutch';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 18.30438805;
5	35.206717;
9	68.13349242;
22	156.9082546;
26	211.8982305;
35	238.7067656;
38	266.9389893;
40	271.2409668;
44	302.0957982;
47	339.5661013;
51	326.8619759;
55	341.8787122;
61	272.7609223;
67	261.9114782;
71	270.7039924];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(40.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Groo1983';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_3: v is reduced';
D2 = 'mod_3: food availability taken variable in tW data';
D3 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '59ZVQ'; % Cat of Life
metaData.links.id_ITIS = '177851'; % ITIS
metaData.links.id_EoL = '45509442'; % Ency of Life
metaData.links.id_Wiki = 'Tyto_alba'; % Wikipedia
metaData.links.id_ADW = 'Tyto_alba'; % ADW
metaData.links.id_Taxo = '54626'; % Taxonomicon
metaData.links.id_WoRMS = '1484610'; % WoRMS
metaData.links.id_avibase = '96B91A6873827284'; % avibase
metaData.links.id_birdlife = 'common-barn-owl-tyto-alba'; % birdlife
metaData.links.id_AnAge = 'Tyto_alba'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tyto_alba}}';
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
bibkey = 'CramSimm2004'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {2004}, ' ...
'title = {BWPi: Birds of the Western Palearctic interactive (DVD-ROM)}, ' ...
'howpublished = {DVD-ROM}, ' ...
'publisher = {BirdGuides Ltd}, '...
'address = {Sheffield}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
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
bibkey = 'Groo1983'; type = 'Article'; bib = [ ... 
'author = {De Groot, R. S.}, ' ... 
'year = {1983}, ' ...
'title = {Origin, status and ecology of the owls in the Galapagos}, ' ...
'journal = {Ardea}, ' ...
'volume = {71}, ' ...
'pages = {167--182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DuraLand2008'; type = 'Article'; bib = [ ... 
'author = {Durant, J. M. and Landys, M. M. and Handrich, Y.}, ' ... 
'year = {2008}, ' ...
'title = {Composition of the body mass overshoot in European barn owls nestlings (\emph{Tyto alba}): insurance against scarcity of energy or water?}, ' ...
'journal = {Journal of Comparative Physiology B}, ' ...
'volume = {178}, ' ...
'pages = {563--571}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NagaThiy2002'; type = 'Article'; bib = [ ... 
'author = {Nagarajan, R. and Thiyagesan, K. and Natarajan, R. and Kanakasabai, R.}, ' ... 
'year = {2002}, ' ...
'title = {Patterns of growth in nestling indian barn-owls}, ' ...
'journal = {The Condor}, ' ...
'volume = {104}, ' ...
'pages = {885--890}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Howe1964'; type = 'Article'; bib = [ ... 
'author = {Howell, T. R.}, ' ... 
'year = {1964}, ' ...
'title = {Notes on incubation and nestling temperatures and behaviour of captive owls}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {76}, ' ...
'pages = {28--36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Edwa1987'; type = 'Article'; bib = [ ... 
'author = {Edwards, T. C.}, ' ... 
'year = {1987}, ' ...
'title = {Standard Rate of Metabolism in the Common Barn-Owl (\emph{Tyto alba})}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {99}, ' ...
'pages = {704--706}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tyto_alba}}';
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

