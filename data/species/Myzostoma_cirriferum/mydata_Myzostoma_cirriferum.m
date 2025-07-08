function [data, auxData, metaData, txtData, weights] = mydata_Myzostoma_cirriferum

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Myzostomida'; 
metaData.family     = 'Myzostomidae';
metaData.species    = 'Myzostoma_cirriferum'; 
metaData.species_en = 'Feather Star Louse'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTie', 'jiPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li';'Wwb'; 'Wwp'; 'Wwi';}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 16]; 

%% set data
% zero-variate data

data.tp = 55;    units.tp = 'd';    label.tp = 'pinnular stage';            bibkey.tp = 'EeckJang1997';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'all temps are guessed';
data.am = 190;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'EeckJang1997';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.05;   units.Lp  = 'cm';  label.Lp  = 'body length at puberty'; bibkey.Lp  = 'EeckJang1997';
data.Li  = 0.21;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'EeckJang1997';
 
data.Wwb = 5.2e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on guessed egg diameter of 100 mum: pi/6*0.01^3';
data.Wwp = 2.3e-5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 1.7e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on disc-shape of hight 0.05 cm: pi/4*Li^2*0.05';

% uni-variate data

% time-length
data.tL = [ ... time (d), body length (mum)
 0	674.269
25	987.299
44	991.995
66	1164.479];
data.tL(:,2) = data.tL(:,2)/ 1e4; % convert mum to cm
units.tL   = {'d', 'cm'};  label.tL = {'time', 'body length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EeckJang1997';

% length-eggs 
data.LN = [ ... % body length (cm), number of previtellogenic oocytes
0.051	  35
0.070	 636
0.071	 296
0.080	 911
0.081	 531
0.082	 387
0.083	 609
0.100	 530
0.101	1289
0.110	1589
0.111	1393
0.112	1262
0.113	 935
0.114	 686
0.130	2282
0.131	2177
0.132	1771
0.133	1614
0.134	1090
0.140	2176
0.141	1797
0.142	1090
0.150	3851
0.151	2555
0.152	2149
0.153	2071
0.161	3549
0.170	4373
0.171	3156]; 
units.LN  = {'cm', '#'};  label.LN = {'body length', 'cumulative # of eggs'};  
temp.LN   = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'EeckJang1997';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R was fixed at 0.95/2 because of hermaphroditism';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'obligate symbiont of Rosy Feather-star Antedon bifida; one youngs are parasites, older one commensals';
metaData.bibkey.F1 = 'EeckJang1997'; 
F2 = 'pinnular stage lasts 55 d (fixed in pinnular grooves, generally close to the calyx, causing some deformation), vagile phase 135 d (free moving)';
metaData.bibkey.F2 = 'EeckJang1997'; 
F3 = 'hermaphroditic';
metaData.bibkey.F3 = 'EeckJang1997'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46498021'; % Ency of Life
metaData.links.id_Wiki = 'Myzostoma_cirriferum'; % Wikipedia
metaData.links.id_ADW = 'Myzostomum_cirriferum'; % ADW
metaData.links.id_Taxo = '169007'; % Taxonomicon
metaData.links.id_WoRMS = '130336'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myzostoma_cirriferum}}';
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
bibkey = 'EeckJang1997'; type = 'Article'; bib = [ ... 
'author = {I. Eeckhaut and M. Jangoux}, ' ... 
'year = {1997}, ' ...
'title = {Infestation, population dynamics, growth and reproductive cycle of \emph{Myzostoma cerriferum} ({M}yzostomida), an obligate symbiont of comatulid crinoid \emph{Antedon bifida} ({C}rinoidea, {E}chinodermata)}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {38}, ' ...
'pages = {7--18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
