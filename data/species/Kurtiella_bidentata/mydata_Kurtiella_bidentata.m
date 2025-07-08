function [data, auxData, metaData, txtData, weights] = mydata_Kurtiella_bidentata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Galeommatida'; 
metaData.family     = 'Lasaeidae';
metaData.species    = 'Kurtiella_bidentata'; 
metaData.species_en = 'Two-toothed Montagu shell'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Li'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 08]; 

%% set data
% zero-variate data

data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FoigMcGr1984';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.014; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Franz1973';
  comment.Lb = 'data for Kurtiella planulata';
data.Lj  = 0.028; units.Lj  = 'cm';  label.Lj  = 'shell length at settling'; bibkey.Lj  = 'Franz1973';
  comment.Lj = 'data for Kurtiella planulata';
data.Lp  = 0.16; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'FoigMcGr1984';
data.Li  = 0.39;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'FoigMcGr1984';

data.Wwi = 42e-3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Sphaerium corneum: 2.32*(0.39/1.486)^3';

% uni-variate data

% time-length 
data.tL = [ ... % time since 1 nOV 1978 (d), shell length (cm)
0.000	0.081
28.338	0.069
60.700	0.068
89.244	0.071
122.595	0.059
159.662	0.075
182.493	0.079
212.877	0.101
248.080	0.105
273.708	0.127
303.189	0.135
336.424	0.159
397.318	0.165
428.731	0.163
490.509	0.190
520.991	0.182
549.537	0.184
582.832	0.190
611.373	0.193
639.865	0.212
710.216	0.237
365+0	0.167
365+28.913	0.188
365+64.135	0.186
365+89.880	0.171
365+120.334	0.172
365+183.094	0.189
365+211.645	0.190
365+243.962	0.203
365+275.270	0.235
365+304.800	0.227
365+337.158	0.227
365+402.795	0.238
365+434.273	0.216
365+458.965	0.233
365+492.200	0.257
365+520.816	0.238
365+585.500	0.249
365+617.769	0.277
365+646.327	0.276
365+679.629	0.279
365+707.144	0.306];
[t, i] = sort(data.tL(:,1)); data.tL = data.tL(i,:); % sort times
data.tL(:,1) = data.tL(:,1) + 45; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FoigMcGr1984';
comment.tL = 'Data from Margaretta station within Inner Galway Bay, west coast of Ireland';

% time-length pre metam
data.tLe = [ ... % time since birth (d), shell length (mum)
0.000	141.327
9.012	177.659
13.043	247.692
13.992	264.963
15.731	300.127];
data.tLe(:,2) = data.tLe(:,2)/1e4; % convert mum to cm
units.tLe   = {'d', 'cm'};  label.tLe = {'time since birth', 'shell length'};  
temp.tLe    = C2K(25);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'FoigMcGr1984';
comment.tLe = 'Data for Kurtiella planulata from laboratory, fed with Isochrysis galbana;';

% length-fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
0.168	99.998
0.179	177.055
0.195	381.071
0.209	309.655
0.216	348.744
0.226	303.690
0.226	529.821
0.234	393.108
0.237	271.953
0.238	639.929
0.240	182.975
0.245	919.398
0.247	649.416
0.252	589.368
0.262	701.885
0.265	920.932
0.276	688.238];
units.LN   = {'cm', '#'};  label.LN = {'shell length', 'fecundity'};  
temp.LN    = C2K(11);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Franz1973';
comment.LN = 'Data from Margaretta station within Inner Galway Bay, west coast of Ireland';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperature in C for tL data varies with time in d as T(t)=11+4*sin(2*pi*(t+112)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Associated with brittlestar Amphiura filiformis';
metaData.bibkey.F1 = 'FoigMcGr1984'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RG86'; % Cat of Life
metaData.links.id_ITIS = '80659'; % ITIS
metaData.links.id_EoL = '46471390'; % Ency of Life
metaData.links.id_Wiki = 'Lasaeidae'; % Wikipedia
metaData.links.id_ADW = 'Mysella_bidentata'; % ADW
metaData.links.id_Taxo = '3962181'; % Taxonomicon
metaData.links.id_WoRMS = '345281'; % WoRMS
metaData.links.id_molluscabase = '345281'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lasaeidae}}';
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
bibkey = 'FoigMcGr1984'; type = 'Article'; bib = [ ... 
'author = {Diarmaid O Foighil and D. McGrath and M. E. Conneely and B. F. Keegan and M. Costelloe}, ' ... 
'year = {1984}, ' ...
'title = {Population dynamics and reproduction of \emph{Mysella bidentata} ({B}ivalvia: {G}aleommatacea) in {G}alway {B}ay, {I}rish west coast}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {81}, ' ...
'pages = {283-291}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Franz1973'; type = 'Article'; bib = [ ... 
'author = {David R. Franz}, ' ... 
'year = {1973}, ' ...
'title = {The Ecology and Reproduction of a Marine Bivalve, \emph{Mysella planulata} ({E}rycinacea)}, ' ...
'journal = {Biological Bulletin}, ' ...
'volume = {144(1)}, ' ...
'pages = {93-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Mysella-bidentata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

