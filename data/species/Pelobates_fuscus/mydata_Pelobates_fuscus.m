function [data, auxData, metaData, txtData, weights] = mydata_Pelobates_fuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelobatidae';
metaData.species    = 'Pelobates_fuscus'; 
metaData.species_en = 'Common spadefoot'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 10 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};  

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 05 02];              
metaData.email_mod_2    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_2  = {'University of Lisbon'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2023 05 02];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Noll1984';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab = 'pp85';
data.tj = 85;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'Noll1984';   
 temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3.1*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'CogaRosi2014';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
% data.tpm = 3.5*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'CogaRosi2014';
%   temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'CogaRosi2014';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Noll1984';  
% data.Ljb = 7.2;  units.Ljb = 'cm';  label.Ljb  = 'total length of tadpole at metam';   bibkey.Ljb  = 'Noll1984'; 
data.Lj  = 32.61e-1;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'SchmHodl2012'; 
 comment.Lj = '2.8 cm in CogaRosi2014';
data.Lp  = 4.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'CogaRosi2014';
% data.Lpm = 4.0;  units.Lpm = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'CogaRosi2014';
data.Li  = 6.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'CogaRosi2014';
data.Lim = 4.7;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'CogaRosi2014';

data.Wd0 = 0.96e-3; units.Wd0 = 'g'; label.Wd0 = 'dry weight of an egg';     bibkey.Wd0 = 'YermMikh2016';
data.Wwj = 4.46; units.Wwj = 'g'; label.Wwj = 'dry weight of an egg';     bibkey.Wwj = 'SchmHodl2012';
    comment.Wwj = 'males and females combined, hardly any difference';
data.Wwp = 10;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'CogaRosi2014';
% data.Wwpm = 9;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'CogaRosi2014';
data.Wwi = 34;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'CogaRosi2014';
data.Wwim = 11;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'CogaRosi2014';
data.Ri  = 3000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EoL';   
temp.Ri  = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
1.994	3.405
2.951	3.768
2.951	4.131
3.477	4.131
3.940	4.722
3.940	4.776
3.940	5.179
3.956	4.132
3.972	3.930
3.972	3.997
3.972	4.601
4.482	4.991
4.945	5.126
4.961	4.240
4.961	4.750
4.977	3.703
4.977	4.522
4.977	4.710
4.993	5.180
4.993	5.690
4.993	6.173
5.471	4.845
5.950	4.456
5.950	4.671
5.950	4.966
5.950	5.060
5.950	5.812
5.950	5.879
7.002	5.048
7.481	4.780
7.481	5.907];
data.tL_f(:,1) = data.tL_f(:,1)  * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CogaRosi2014';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
1.994	3.995
2.967	4.023
2.968	4.090
3.429	4.480
4.450	4.347
4.945	3.985
4.946	4.092
5.455	4.079
5.456	4.227
5.950	3.932
5.951	4.107
5.952	4.241
5.966	4.402
6.476	4.040
6.492	4.295
6.971	4.376
6.972	4.698
6.987	4.537];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CogaRosi2014';
comment.tL_m = 'Data for males';

data.tL = [ ... time since hatch (d), total length of tadpole (cm)
0.000	0.266
2.413	0.200
4.258	0.175
5.535	0.420
7.097	0.563
9.226	0.599
11.639	0.697
12.916	0.811
15.187	0.813
16.890	0.757
18.452	0.834
20.155	0.909
22.000	1.114
23.845	1.187
26.400	1.283
27.961	1.393
30.374	1.623
32.219	2.386
35.058	1.722
36.619	2.292
38.748	3.478
40.735	2.531
42.865	2.666
45.277	2.699
46.981	3.398
49.252	3.498
51.239	3.340
52.516	4.143
54.645	4.475
56.348	4.321
58.194	4.591
60.181	5.023
62.310	5.093
64.013	5.628
65.716	6.163
67.703	6.628
69.690	6.338
71.394	6.709
75.226	6.393
79.058	7.260
82.606	6.818
84.452	7.186
88.000	6.251
88.994	5.219
93.110	3.323
97.510	2.080
102.761	2.271];
units.tL  = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL   = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Noll1984';
comment.tL = 'Data for tadpoles';

% length-weight
data.LW_f = [ ... % SVL (cm) wet weight (g)
3.691	6.379
3.762	4.865
3.859	6.644
3.894	7.660
3.948	8.423
4.072	8.938
4.080	10.964
4.098	6.155
4.187	8.440
4.222	10.721
4.399	11.494
4.497	7.703
4.568	11.253
4.612	7.965
4.638	12.777
4.718	13.542
4.736	10.252
4.780	13.800
4.807	11.523
4.931	13.051
5.019	13.311
5.046	17.616
5.082	12.049
5.099	19.645
5.197	11.551
5.205	15.096
5.851	32.611
5.878	28.309
6.126	33.897];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL','wet weight', 'female'};  
bibkey.LW_f = 'CogaRosi2014';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (cm) wet weight (g)
3.710	6.848
3.754	8.370
3.861	5.326
3.896	6.848
3.932	7.862
3.994	9.130
4.012	5.580
4.101	7.355
4.101	5.072
4.127	8.877
4.216	9.130
4.225	6.087
4.304	11.159
4.305	9.130
4.340	7.101
4.429	10.906
4.465	7.609
4.482	9.130
4.589	8.623
4.598	10.145
4.615	12.174
4.713	12.681
4.713	9.891
4.757	10.906];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL','wet weight', 'male'};  
bibkey.LW_m = 'CogaRosi2014';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only; mod_2: tadpoles have varying shape coefficient.';
D2 = 'mod_0 and mod_1: males are assumed to differ from females by {p_Am} and E_Hp only. mod_2: males and females differ by {p_Am} only. Data for ages, lenghts and weights at puberty hardly differed, so are not longer included as different.';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: added different f for tL_f and tL_m. Added a single functional response for tadpole stage (as opposed to having it vary), added new data: dry weight of egg and wet weight at metamorphosis. Double checked the incubation time and temperature.';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '76CZD'; % Cat of Life
metaData.links.id_ITIS = '664730'; % ITIS
metaData.links.id_EoL = '330757'; % Ency of Life
metaData.links.id_Wiki = 'Pelobates_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Pelobates_fuscus'; % ADW
metaData.links.id_Taxo = '47555'; % Taxonomicon
metaData.links.id_WoRMS = '1506630'; % WoRMS
metaData.links.id_amphweb = 'Pelobates+fuscus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pelobates_fuscus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelobates_fuscus}}';
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
bibkey = 'Noll1984'; type = 'Book'; bib = [ ...  
'author = {N\"{o}llert, A.}, ' ...
'year = {1984}, ' ...
'title  = {Die {K}noblauchkr\"{o}te \emph{Pelobates fuscus}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CogaRosi2014'; type = 'Article'; bib = [ ... 
'author = {D. Cogalniceanu and D. Rosioru and P. Szekely and D. Szekely and E. Buhaciuc and F. Stanescu and C. Miaud}, ' ... 
'year = {2014}, ' ...
'title = {Age and Body Size in Populations of Two Syntopic Spadefoot Toads (Genus \emph{Pelobates}) at the Limit of Their Ranges}, ' ...
'journal = {Journal of Herpetology}, ' ...
'number = {4}, ' ...
'volume = {48}, ' ...
'pages = {537-545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YermMikh2016'; type = 'Article'; bib = [ ... 
'author = {Yermokhin, Mikhail and Tabachishin, Valily and Ivanov, Gleb}, ' ... 
'year = {2016}, ' ...
'title = {A method for estimating fecundity in the spadefoot toad, \emph{Pelobates fuscus}, through full and partial egg-counting}, ' ...
'journal = {Salamandra}, ' ...
'volume = {52}, ' ...
'pages = {337--341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchmHodl2012'; type = 'Article'; bib = [ ... 
'author = {Schmidt, Benedikt R. and Hödl, Walter and Schaub, Michael}, ' ... 
'year = {2012}, ' ...
'title = {From metamorphosis to maturity in complex life cycles: equal performance of different juvenile life history pathways}, ' ...
'journal = {Ecology}, ' ...
'number = {3}, ' ...
'volume = {93}, ' ...
'doi = {10.1890/11-0892.1}, ' ...
'pages = {657--667}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Pelobates&where-species=fuscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelobates_fuscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/330757/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
