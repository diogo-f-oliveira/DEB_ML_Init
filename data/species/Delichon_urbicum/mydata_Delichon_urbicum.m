function [data, auxData, metaData, txtData, weights] = mydata_Delichon_urbicum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Hirundinidae';
metaData.species    = 'Delichon_urbicum'; 
metaData.species_en = 'Common house martin'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14 to 16 d';
data.tx = 26;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Brya1978';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 22 to 32 d';
data.tp = 78;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 22 to 32 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Wiki: egg weight 1.7 g';
data.Wwi = 32;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Brya1978';
  comment.Wwi = 'asymptotic weight of nestling, adults typically 114.5 g (AnAge), 18.3 g (Wiki)';

data.Ri  = 2*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 5 eggs per clutch, 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.994	3.330
1.914	4.531
3.005	5.824
4.000	9.432
5.154	11.466
8.057	18.864
9.097	20.898
10.135	22.747
11.281	23.669
12.425	24.406
15.195	21.805
16.101	21.154
17.296	21.150
17.981	21.426
19.472	22.903
22.139	21.784
23.100	20.855
24.174	19.833
25.195	19.367
26.160	18.994];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Brya1978';
%
data.tW1 = [ ...
0.994	3.330
1.967	4.068
3.229	5.268
4.215	7.765
5.087	10.170
8.105	17.753
9.087	19.602
10.236	20.987
11.156	22.188
12.185	22.833
15.260	22.916
16.162	21.802
17.302	21.984
18.269	21.888
19.302	22.904
22.080	21.506
22.984	20.485
24.232	19.925
25.194	19.182
26.156	18.438];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Brya1978';
%
data.tW2 = [ ...
1.099	2.219
1.899	2.587
2.929	3.324
4.082	5.173
5.008	7.207
8.213	16.919
9.230	15.990
10.157	18.117
10.903	18.855
12.109	20.333
15.240	20.324
16.145	19.487
16.946	20.040
18.203	20.592
19.177	21.422
22.085	22.154
23.099	20.762
24.004	19.926
25.081	19.367
26.045	18.809];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2   = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Brya1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
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

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for 3 chicks in one nest'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Relative food intake decreases towards fledging';
D3 = 'mod_1: v is reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '34GHX'; % Cat of Life
metaData.links.id_ITIS = '726115'; % ITIS
metaData.links.id_EoL = '45511468'; % Ency of Life
metaData.links.id_Wiki = 'Delichon_urbicum'; % Wikipedia
metaData.links.id_ADW = 'Delichon_urbicum'; % ADW
metaData.links.id_Taxo = '1125977'; % Taxonomicon
metaData.links.id_WoRMS = '212752'; % WoRMS
metaData.links.id_avibase = 'E4BB82F50C488B8B'; % avibase
metaData.links.id_birdlife = 'northern-house-martin-delichon-urbicum'; % birdlife
metaData.links.id_AnAge = 'Delichon_urbicum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Delichon_urbica}}';
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
bibkey = 'Brya1978'; type = 'Article'; bib = [ ... 
'author = {D. M. Bryant}, ' ... 
'doi = {10.1111/j.1474-919X.1978.tb04995.x}, ' ...
'year = {1978}, ' ...
'title = {ESTABLISHMENT OF WEIGHT HIERARCHIES IN THE BROODS OF HOUSE MARTINS \emph{Delichon urbica}}, ' ...
'journal = {Ibis}, ' ...
'volume = {120}, ' ...
'pages = {16-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Delichon_urbicum}}';
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

