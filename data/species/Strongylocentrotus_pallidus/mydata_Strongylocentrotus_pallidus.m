function [data, auxData, metaData, txtData, weights] = mydata_Strongylocentrotus_pallidus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Strongylocentrotidae';
metaData.species    = 'Strongylocentrotus_pallidus'; 
metaData.species_en = 'Pale sea urchin'; 

metaData.ecoCode.climate = {'MC';'ME'};
metaData.ecoCode.ecozone = {'MPNE';'MN'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2021 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 23]; 

%% set data
% zero-variate data

data.tj = 45;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temps are guessed; tj based on that of Echinus_esculentus';
data.am = 42*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'BluhPiep1998';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.5;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Strongylocentrotus_droebachiensis';
data.Li  = 9;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'BluhPiep1998';

data.Wwb = 1.15e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'FalkLonn1983';
  comment.Wwb = 'based on egg diameter of 130 mum: pi/6*0.013^3';

data.GSI = 0.18;   units.GSI = '-';   label.GSI = 'gonado somatic index';       bibkey.GSI = 'FalkLonn1983';
  temp.GSI = C2K(0);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data

% time-length
data.tL = [ ... % time since settlement (yr), test diameter (cm)
3.964	0.601
3.969	0.411
3.972	0.292
4.991	0.620
4.996	0.420
5.951	0.702
6.975	0.821
6.978	0.703
7.933	1.003
8.066	0.812
8.072	0.603
8.963	0.894
8.965	0.803
9.078	1.412
9.974	1.495
9.977	1.404
10.935	1.586
10.937	1.504
11.004	1.404
11.006	1.304
11.838	1.404
11.897	1.595
11.900	1.504
12.926	1.514
12.993	1.405
12.996	1.314
12.998	1.223
13.884	1.723
14.030	1.023
14.148	1.432
15.044	1.524
15.052	1.205
15.107	1.587
15.746	1.706
15.877	1.597
15.879	1.506
15.882	1.379
15.935	1.815
16.968	1.615
17.925	1.807
17.935	1.425
17.979	2.234
18.120	1.725
19.083	1.716
19.088	1.516
19.859	1.498
19.921	1.589
19.983	1.680
20.102	2.016
20.161	2.226
20.936	2.035
20.939	1.935
20.945	1.689
20.950	1.508
21.119	2.426
21.910	1.608
21.969	1.799
22.017	2.426
22.084	2.317
22.867	1.817
22.975	2.608
23.795	3.181
24.070	2.491
24.073	2.345
24.146	2.027
24.918	1.936
24.960	2.809
24.965	2.627
24.970	2.409
24.974	2.282
24.975	2.218
25.011	3.318
25.922	2.828
25.992	2.600
25.994	2.528
25.997	2.409
26.036	3.409
26.070	2.091
26.769	2.337
26.955	2.601
26.957	2.537
27.029	2.237
27.049	3.946
27.733	2.301
27.958	3.537
28.804	3.101
28.859	3.429
28.949	2.438
28.952	2.301
30.100	2.611
30.102	2.511
30.785	3.438
30.931	2.729
31.828	2.812
31.905	2.312
31.933	3.721
32.777	3.339
32.847	3.112
32.864	2.430
33.892	2.412
36.877	3.632
38.025	3.932
38.097	3.623
42.953	4.479];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'test diameter'};  
temp.tL    = C2K(0);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BluhPiep1998';
 
% length-weight
data.LWd = [ ... % test diameter (cm), AFDW (g)
0.515	0.009
0.620	0.018
0.716	0.027
0.812	0.045
0.916	0.027
1.004	0.027
1.082	0.054
1.231	0.028
1.326	0.063
1.422	0.072
1.423	0.054
1.510	0.116
1.510	0.063
1.632	0.089
1.710	0.107
1.824	0.107
1.911	0.168
2.007	0.151
2.129	0.151
2.216	0.221
2.216	0.160
2.312	0.178
2.321	0.108
2.417	0.204
2.521	0.239
2.522	0.195
2.522	0.152
2.600	0.239
2.600	0.178
2.617	0.292
2.687	0.178
2.704	0.318
2.705	0.248
2.809	0.292
2.809	0.222
2.810	0.178
2.913	0.371
2.914	0.318
2.914	0.275
3.018	0.318
3.096	0.458
3.105	0.432
3.105	0.380
3.115	0.205
3.200	0.581
3.210	0.345
3.211	0.301
3.385	0.371
3.401	0.529
3.402	0.485
3.507	0.302
3.515	0.590
3.602	0.494
3.617	0.992
3.680	0.695
3.698	0.459
3.795	0.363
3.819	0.687
3.908	0.372
3.975	0.984
4.002	0.835
4.004	0.477
4.004	0.398
4.097	1.098
4.097	0.958
4.098	0.871
4.099	0.722
4.291	0.617
4.299	0.722
4.413	0.696
4.616	1.885
4.785	1.256
4.795	1.099
5.389	2.612
5.414	2.848
5.501	2.865
5.512	2.524
5.694	2.778
5.998	3.102
6.308	3.810
6.490	4.108
6.700	3.924];
units.LWd   = {'cm', 'd'};  label.LWd = {'test diameter','Ash-free dry weight'};  
bibkey.LWd = 'BluhPiep1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.3; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Occasionally interbreeds with Strongylocentrotus_droebachiensis';
metaData.bibkey.F1 = 'FalkLonn1983'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '534MF'; % Cat of Life
metaData.links.id_ITIS = '157972'; % ITIS
metaData.links.id_EoL = '599672'; % Ency of Life
metaData.links.id_Wiki = 'Strongylocentrotus_pallidus'; % Wikipedia
metaData.links.id_ADW = 'Strongylocentrotus_pallidus'; % ADW
metaData.links.id_Taxo = '598565'; % Taxonomicon
metaData.links.id_WoRMS = '124324'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Strongylocentrotus_purpuratus}}';
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
bibkey = 'BluhPiep1998'; type = 'Article'; bib = [ ... 
'author = {Bodil A. Bluhm and Dieter Piepenburg and Karen von Juterzenka}, ' ... 
'year = {1998}, ' ...
'title = {Distribution, standing stock, growth, mortality and production of \emph{Strongylocentrotus pallidus} ({E}chinodermata: {E}chinoidea) in the northern {B}arents {S}ea}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {20}, ' ...
'pages = {325-334}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FalkLonn1983'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00364827.1983.10420567}, ' ...
'author = {Inger-Britt Falk-Petersen and Sunniva L{\o}nning}, ' ... 
'year = {1983}, ' ...
'title = {Reproductive cycles of two closely related sea urchin species, \emph{Strongylocentrotus droebachiensis} ({O}.{F}. {M}\"{u}ller) and \emph{Strongylocentrotus pallidus} ({G}.{O}. {S}ars)}, ' ...
'journal = {Sarsia}, ' ...
'volume = {68(2)}, ' ...
'pages = {157-164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

