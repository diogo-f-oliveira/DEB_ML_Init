function [data, auxData, metaData, txtData, weights] = mydata_Patagioenas_fasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Patagioenas_fasciata'; 
metaData.species_en = 'Band-tailed pigeon'; 

metaData.ecoCode.climate = {'BSk', 'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(37.85); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '18 till 21 d';
data.tx = 24;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'EoL';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '20 till 28 d';
data.tp = 72;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18.5*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 14;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OehlNova2018';
data.Wwi = 220;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'OehlNova2018';
  comment.Wwi = 'AnAge: 315 g; Wiki: 225 till 515 g; different subspecies';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'EoL 1 till 3 eggs/clutch,  1 till clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.134	13.498
0.090	15.055
0.940	23.864
0.940	37.890
1.970	28.517
1.970	32.154
1.970	36.309
2.910	32.653
3.045	38.884
3.045	40.961
3.896	44.060
3.896	45.099
4.881	65.337
4.881	67.935
4.881	73.129
5.955	78.821
5.955	82.457
5.955	86.613
6.851	91.269
6.940	84.513
6.940	94.903
6.985	87.629
7.970	109.946
7.970	112.024
7.970	115.660
8.015	106.308
8.955	124.470
8.955	129.145
10.030	123.927
10.030	128.083
10.030	133.278
10.030	136.914
10.970	148.842
10.970	152.478
10.970	156.115
11.955	156.613
11.955	159.210
11.955	161.288
11.955	163.366
11.955	164.405
12.896	163.346
12.896	169.579
12.940	166.981
13.925	170.077
13.925	176.830
13.925	183.064
14.866	125.381
14.910	136.809
14.910	163.821
14.910	170.055
14.910	172.133
14.955	144.600
14.955	157.587
14.955	178.366
15.000	181.482
15.940	179.384
15.940	187.695
15.985	145.616
15.985	158.084
15.985	191.331
15.985	196.526
16.030	132.109
16.030	169.512
16.925	148.713
16.925	186.116
16.925	192.349
16.925	193.908
16.925	195.466
16.925	197.025
16.925	202.219
16.970	159.621
16.970	171.569
16.970	178.322
17.910	179.860
17.910	183.497
18.000	165.833
18.000	172.586
18.000	187.131
18.000	193.365
18.000	196.482
18.851	216.723
19.881	208.389
19.970	210.985
19.970	216.180
21.940	145.488
22.925	191.180
24.000	183.884];
n = size(data.tW); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'OehlNova2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Wwi = weights.Wwi * 3;

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Neonates receive crop milk from both parents';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DZDT'; % Cat of Life
metaData.links.id_ITIS = '676899'; % ITIS
metaData.links.id_EoL = '45509381'; % Ency of Life
metaData.links.id_Wiki = 'Patagioenas_fasciata'; % Wikipedia
metaData.links.id_ADW = 'Columba_fasciata'; % ADW
metaData.links.id_Taxo = '900949'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '31ACA9981952B4C4'; % avibase
metaData.links.id_birdlife = 'northern-band-tailed-pigeon-patagioenas-fasciata'; % birdlife
metaData.links.id_AnAge = 'Patagioenas_fasciata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Patagioenas_fasciata}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Patagioenas_fasciata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OehlNova2018'; type = 'Article'; bib = [ ... 
'author = {D. A. Oehler and B. J. Novak and S. C. Schmid and K. J. Huth and A. I. Totha and T. Audhya}, ' ... 
'year = {2018}, ' ...
'title = {Husbandry protocols for the Band-tailed pigeon, \emph{Patagioenas fasciata albilinea}, at the {WCS}, {B}ronx {Z}oo for future conservation management programs}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {37}, ' ...
'pages = {46--53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1064947/details}}';
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

