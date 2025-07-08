function [data, auxData, metaData, txtData, weights] = mydata_Tritia_reticulatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Nassariidae';
metaData.species    = 'Tritia_reticulatus'; 
metaData.species_en = 'Netted dog whelk'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 15]; 

%% set data
% zero-variate data

data.ab = 15; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'BarrMore2007';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 38; units.tj = 'd';    label.tj = 'time since birth at settlement'; bibkey.tj = 'ChatRich2007';   
  temp.tj = C2K(16);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChatRich2007';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ChatRich2007';
data.Lp  = 0.64;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'ChatRich2007';
data.Li  = 3.1;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'ChatRich2007';

data.Wwi = 3.4;  units.Wwi = 'g'; label.Wwi = 'ultimate flesh weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on same relative weight, compared to Buccinanops_deformis: 31.6*(3.1/6.5)^3';

data.Ri  = 1050/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'ZupoPatt2009';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'several eggs capsules per individual, 100-120 lecithotrophic embryos per capsule, which developed until the veliger stage was reached';

% uni-variate data
% time-length
data.tL_l = [ ... % time since birth (d), statolith diameter (mum)
1	17.277
7	22.173
14	24.476
21	27.356
28	28.508];
data.tL_l(:,2) = ((data.tL_l(:,2)/ 36.31).^(1/0.464))/10; % convert statolith mum to shell length cm 
units.tL_l   = {'d', 'cm'};  label.tL_l = {'time since birth', 'shell length'};  
temp.tL_l    = C2K(16);  units.temp.tL_l = 'K'; label.temp.tL_l = 'temperature';
bibkey.tL_l = 'ChatRich2007';
comment.tL_l = 'Data for larvae based on statolith diameter with statolith diameter in mum = 36.31 (shell length in mm)^0.464';
%
data.tL = [ ... % time since settlement (d), statolith diameter (mum)
1	33.979
2	36.283
9	38.298
15	40.890
31	40.314
49	41.466
94	43.770
237	70.838
468	93.586];
data.tL(:,2) = ((data.tL(:,2)/ 36.1).^(1/0.464))/10; % convert statolith mum to shell length cm 
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChatRich2007';
comment.tL = 'Data for juveniles based on statolith diameter with statolith diameter in mum = 36.31 (shell length in mm)^0.464';
%
data.tL_a = [ ... % time since settlement (d), shell length (cm)
0.088	0.099
0.088	0.066
0.114	0.124
0.123	0.149
0.988	0.810
0.988	0.768
0.989	0.735
0.989	0.694
0.989	0.677
0.989	0.644
0.989	0.628
0.989	0.603
0.989	0.578
0.990	0.537
0.990	0.512
0.990	0.487
0.996	0.950
0.999	0.446
1.008	0.396
1.969	1.396
1.969	1.355
1.987	1.280
1.993	1.810
1.993	1.793
1.994	1.611
1.994	1.603
1.995	1.553
1.996	1.222
1.996	1.197
1.997	1.148
2.000	2.182
2.006	0.957
2.958	2.098
2.958	2.057
2.958	2.049
2.958	2.015
2.967	1.991
2.974	2.330
2.975	2.164
2.976	1.966
2.977	1.693
2.978	1.643
2.985	1.924
2.985	1.900
2.991	2.462
2.992	2.379
2.994	1.866
2.994	1.850
2.996	1.436
2.997	1.329
3.949	2.387
3.949	2.304
3.958	2.246
3.958	2.196
3.959	2.138
3.965	2.701
3.966	2.436
3.968	2.072
3.968	2.006
3.978	1.874
3.979	1.667
3.988	1.584
4.969	2.079
5.987	2.293];
data.tL_a(:,1) = data.tL_a(:,1) * 365; % convert yr to d
units.tL_a   = {'d', 'cm'};  label.tL_a = {'time since settlement', 'shell length'};  
temp.tL_a    = C2K(16);  units.temp.tL_a = 'K'; label.temp.tL_a = 'temperature';
bibkey.tL_a = 'ChatRich2007';
comment.tL_a = 'Data from Carmel Head to Cemlyn Bay';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_l = 3 * weights.tL_l;
weights.tL = 3 * weights.tL;
weights.tL_a = 3 * weights.tL_a;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'no differences between sexes';
metaData.bibkey.F1 = 'ChatRich2007'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5943F'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46461531'; % Ency of Life
metaData.links.id_Wiki = 'Tritia_reticulatus'; % Wikipedia
metaData.links.id_Taxo = '1272988'; % Taxonomicon
metaData.links.id_WoRMS = '876821'; % WoRMS
metaData.links.id_molluscabase = '876821'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tritia_reticulatus}}';
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
bibkey = 'ChatRich2007'; type = 'Article'; bib = [ ... 
'author = {E. Chatzinikolaou and C. A. Richardson}, ' ... 
'year = {2007}, ' ...
'title = {Evaluating growth and age of netted whelk \emph{Nassarius reticulatus} ({G}astropoda: {N}assariidae) using statolith growth rings}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {342}, ' ...
'pages = {163-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarrMore2007'; type = 'Article'; bib = [ ... 
'author = {C. M. Barroso and M. H. Moreira}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive Cycle of \emph{Nassarius Reticulatus} in the {R}ia {D}e {A}veiro, {P}ortugal: {I}mplications for Imposex Studies}, ' ...
'journal = {J Mar Biol Ass U.K.}, ' ...
'volume = {78}, ' ...
'pages = {1233-1246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZupoPatt2009'; type = 'Article'; bib = [ ... 
'author = {Valerio Zupo and Francesco P. Patti}, ' ... 
'year = {2009}, ' ...
'title = {Laboratory spawning, larval development and metamorphosis of the marine snail \emph{Nassarius reticulatus} ({L}.) ({C}aenogastropoda, {N}assariidae)}, ' ...
'journal = {Invertebrate Reproduction and Development}, ' ...
'volume = {53}, ' ...
'pages = {23-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

