function [data, auxData, metaData, txtData, weights] = mydata_Spheniscus_demersus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Spheniscus_demersus'; 
metaData.species_en = 'African penguin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MISW', 'MASE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 40;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '60 till 100 d';
data.tp = 195;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '60 till 100 d';
data.tR = 4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '4 yrs for female, 5 yrs for male';
data.am = 27.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 94;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ClarFerg1994';
data.Wwi = 3500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = '2.2 till 3.5 kg';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
2.868	99.170
4.042	94.373
4.825	98.439
5.831	98.063
6.783	102.066
7.959	114.702
8.968	127.400
9.866	144.498
10.933	174.608
12.052	178.548
12.783	200.067
13.679	208.448
14.857	229.800
16.034	242.436
16.879	276.987
17.946	302.738
18.958	332.869
20.084	376.032
20.816	401.908
21.887	449.450
22.851	523.182
24.098	609.883
25.051	622.603
25.963	718.145
26.806	743.980
28.047	800.176
28.890	821.653
29.914	917.154
30.819	973.474
31.895	1047.164
33.143	1146.940
34.107	1216.314
35.073	1298.762
36.030	1337.629
37.226	1454.858
38.016	1493.788
39.156	1606.679
40.070	1710.938
42.120	1910.657];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ClarFerg1994';

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
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6YXJD'; % Cat of Life
metaData.links.id_ITIS = '174462'; % ITIS
metaData.links.id_EoL = '45512089'; % Ency of Life
metaData.links.id_Wiki = 'Spheniscus_demersus'; % Wikipedia
metaData.links.id_ADW = 'Spheniscus_demersus'; % ADW
metaData.links.id_Taxo = '51420'; % Taxonomicon
metaData.links.id_WoRMS = '212659'; % WoRMS
metaData.links.id_avibase = '9B183BDD66511DD8'; % avibase
metaData.links.id_birdlife = 'african-penguin-spheniscus-demersus'; % birdlife
metaData.links.id_AnAge = 'Spheniscus_demersus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spheniscus_demersus}}';
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
bibkey = 'ClarFerg1994'; type = 'Article'; bib = [ ... 
'author = {M. Clark and A. Ferguson and A. Maskell and F. Smith}, ' ... 
'year = {1994}, ' ...
'title = {Breeding the Black-footed penguin at {London Zoo} \emph{Spheniscus demersus}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {33}, ' ...
'pages = {19--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Spheniscus_demersus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049617/overview}}';
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

