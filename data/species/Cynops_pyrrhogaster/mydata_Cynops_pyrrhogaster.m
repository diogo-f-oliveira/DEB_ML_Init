function [data, auxData, metaData, txtData, weights] = mydata_Cynops_pyrrhogaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Cynops_pyrrhogaster'; 
metaData.species_en = 'Japanese fire-bellied newt'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Dfb', 'Dfc', 'Dsc', 'Dwa', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'tp'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 29];

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'AnAge';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 0.9*365;  units.tj = 'd';    label.tj = 'time since brith at metam'; bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 2.5*365;  units.tp = 'd';    label.tp = 'time since brith at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 3;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'guess'; 
data.Lp  = 6.12;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess'; 
data.Lpm  = 5.76; units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'guess'; 
data.Li  = 7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL  for females';   bibkey.Li  = 'UedaMaru2000';
  comment.Li = 'Wiki: TL = 15 cm';
data.Lim  = 6.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'UedaMaru2000';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 3.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Onychodactylus japonicus: (12.5/17)^3*9.65';

data.Ri = 200/365;  units.Ri = '#/d';    label.Ri = 'max reprod rate';       bibkey.Ri = 'Anage';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '200 eggs per clutch, one clutch per yr';
  
% univariate data
% time-length
data.tL_T1fm = [... % time since birth (d), SVL (cm)
 3	5.411 4.618
 3	5.513 4.822
 3  NaN   4.912
 3  NaN   5.116
 3  NaN   5.298
 4	5.900 4.847
 4	5.628 4.937
 4	5.719 5.028
 4  NaN   5.379
 4  NaN   5.424
 4  NaN   5.300
 5	5.698 5.030
 5	5.800 5.336
 5	6.094 5.450
 5	6.230 NaN
 5	5.597 NaN
 6	5.598 5.327
 6	5.723 NaN
 6	6.119 NaN
 6	6.221 NaN
 7	6.031 5.296
 7	6.427 NaN
11	5.916 NaN];
data.tL_T1fm(:,1) = 365 * (0.5+data.tL_T1fm(:,1));
units.tL_T1fm  = {'d', 'cm'}; label.tL_T1fm = {'time since birth', 'SVL'};  
temp.tL_T1fm   = C2K(18);  units.temp.tL_T1fm = 'K'; label.temp.tL_T1fm = 'temperature';
bibkey.tL_T1fm = 'UedaMaru2000'; treat.tL_T1fm = {1, {'females','males'}}; label.treat.tL_T1fm = 'Mt. Takanawa';
comment.tL_T1fm = 'Data for females, males from a paddyfield at Mt. Takanawa, 140 m alt';
%
data.tL_T4fm = [... % time since birth (d), SVL (cm)
 5  NaN   3.103
 6	4.538 4.408
 6  NaN   3.337
 7	5.164 NaN
 7	6.104 NaN
 8	5.372 NaN
 9	6.207 4.248
 9	5.789 4.431
 9	6.494 4.535
 9  NaN   4.927
 9  NaN   5.606
 9  NaN   3.778
 9  NaN   3.961
 9  NaN   3.177
10	5.631 3.803
10  NaN   4.117
10  NaN   5.161
11	5.474 3.436
11	5.578 4.585
11	5.604 NaN
11	5.683 NaN
11	6.205 NaN
11	5.108 NaN
12	6.491 4.532
12	5.577 3.252
12	5.995 3.409
12	6.282 4.375
12  NaN   3.592
12  NaN   3.801
13	6.595 4.923
13	5.654 4.662
13  NaN   3.277
13  NaN   3.773
13  NaN   3.982
13  NaN   4.139
13  NaN   4.296
14	5.340 4.296
14	6.201 3.094
14  NaN   4.347
15  NaN   3.772
15  NaN   3.954
15  NaN   4.242
23  NaN   3.711];
data.tL_T4fm(:,1) = 365 * (0.5+data.tL_T4fm(:,1));
units.tL_T4fm  = {'d', 'cm'}; label.tL_T4fm = {'time since birth', 'SVL'};  
temp.tL_T4fm   = C2K(14);  units.temp.tL_T4fm = 'K'; label.temp.tL_T1fm = 'temperature';
bibkey.tL_T4fm = 'UedaMaru2000'; treat.tL_T4fm = {1, {'females','males'}}; label.treat.tL_T4fm = 'Mt. Takanawa';
comment.tL_T4fm = 'Data for females, males from a paddyfield at Mt. Takanawa, 780 m alt';
% 
data.tL_S1fm = [... % time since birth (d), SVL (cm)
3	5.380 4.811
3	5.698 4.993
3	5.607 5.289
4	6.287 5.014
4	5.889 5.196
4	6.002 5.286
4	5.695 4.741
5	5.523 5.375
5	5.591 4.784
5	6.375 5.489
6	6.191 5.305
6	6.305 5.475
6	6.373 5.702
6	6.680 5.600
7	6.087 5.473];
data.tL_S1fm(:,1) = 365 * (0.5+data.tL_S1fm(:,1));
units.tL_S1fm  = {'d', 'cm'}; label.tL_S1fm = {'time since birth', 'SVL'};  
temp.tL_S1fm   = C2K(18);  units.temp.tL_S1fm = 'K'; label.temp.tL_S1fm = 'temperature';
bibkey.tL_S1fm = 'UedaMaru2000'; treat.tL_S1fm = {1, {'females','males'}}; label.treat.tL_S1fm = 'Mt. Saragamine';
comment.tL_S1fm = 'Data for females, males from a abondoned paddyfield at Mt. Saragamine, 120 m alt';
% 
data.tL_S3fm = [... % time since birth (d), SVL (cm)
 6  NaN   5.254
 6  NaN   5.332
 6  NaN   4.851
 7	5.925 5.332
 7	5.791 5.410
 7	6.160 5.500
 7  NaN   5.153
 8	5.836 5.489
 8	6.104 5.590
 8	6.239 5.332
 9	6.362 5.209
 9	5.657 5.299
 9	5.746 NaN
 9	5.914 NaN
 9	6.093 NaN
10	5.925 5.299
10	6.261 5.276
10	6.172 5.466
10  NaN   5.164
10  NaN   5.567
10  NaN   5.746
11	6.060 5.388
11	6.216 5.455
11  NaN   5.522
11  NaN   5.802
12	5.813 NaN
12	6.194 NaN
12	6.418 NaN
12	6.474 NaN
12	6.116 NaN
13	5.959 5.220
13  NaN   5.388
13  NaN   5.634
14  NaN   5.444
14  NaN   5.612];
data.tL_S3fm(:,1) = 365 * (0.5+data.tL_S3fm(:,1));
units.tL_S3fm  = {'d', 'cm'}; label.tL_S3fm = {'time since birth', 'SVL'};  
temp.tL_S3fm   = C2K(13);  units.temp.tL_S3fm = 'K'; label.temp.tL_S3fm = 'temperature';
bibkey.tL_S3fm = 'UedaMaru2000'; treat.tL_S3fm = {1, {'females','males'}}; label.treat.tL_S3fm = 'Mt. Saragamine';
comment.tL_S3fm = 'Data for females, males from a abondoned paddyfield at Mt. Saragamine, 1140 m alt';
%
data.tL_I1fm = [... % time since birth (d), SVL (cm)
 5  NaN   4.985
 5  NaN   4.815
 5  NaN   4.589
 6	5.392 5.223
 6	5.834 5.087
 6	5.743 4.985
 6  NaN   4.815
 6  NaN   5.313
 7	6.026 5.245
 7	5.789 5.008
 7	5.698 5.404
 7  NaN   5.313
 7  NaN   5.132
 8	5.857 5.223
 9	5.664 NaN
10	6.151 NaN
10	6.004 NaN
11	5.857 NaN
12	6.355 NaN];
data.tL_I1fm(:,1) = 365 * (0.5+data.tL_I1fm(:,1));
units.tL_I1fm  = {'d', 'cm'}; label.tL_I1fm = {'time since birth', 'SVL'};  
temp.tL_I1fm   = C2K(17);  units.temp.tL_I1fm = 'K'; label.temp.tL_I1fm = 'temperature';
bibkey.tL_I1fm = 'UedaMaru2000'; treat.tL_I1fm = {1, {'females','males'}}; label.treat.tL_I1fm = 'Mt. Ishizuchi';
comment.tL_I1fm = 'Data for females, males from a stream paddyfield at Mt. Ishizuchi, 500 m alt';
%
data.tL_I5fm = [... % time since birth (d), SVL (cm)
 6  NaN   5.543
 6  NaN   5.429
 6  NaN   5.305
 6  NaN   5.237
 7	6.585 5.668
 7	6.019 5.317
 8	6.438 5.578
 8	5.861 5.476
 8	5.816 NaN
 8	6.608 NaN
 8	6.133 NaN
 9	6.292 5.647
 9  NaN   5.432
 9  NaN   6.122
10	6.474 5.625
10	6.213 5.523
10	6.168 NaN
10	6.100 NaN
10	5.964 NaN
10	5.885 NaN
10	5.806 NaN
11	5.908 5.773
11	6.158 5.365
11	6.067 NaN
12	6.905 5.785
12	6.419 5.219
12  NaN   5.615
12  NaN   5.174
13	6.623 NaN
13	6.453 NaN
13	6.216 NaN
14	6.137 5.639
14	6.081 NaN
15	6.229 NaN
16  NaN   5.754];
data.tL_I5fm(:,1) = 365 * (0.5+data.tL_I5fm(:,1));
units.tL_I5fm  = {'d', 'cm'}; label.tL_I5fm = {'time since birth', 'SVL'};  
temp.tL_I5fm   = C2K(13);  units.temp.tL_I5fm = 'K'; label.temp.tL_51fm = 'temperature';
bibkey.tL_I5fm = 'UedaMaru2000'; treat.tL_I5fm = {1, {'females','males'}}; label.treat.tL_I5fm = 'Mt. Ishizuchi';
comment.tL_I5fm = 'Data for females, males from a stream paddyfield at Mt. Ishizuchi, 820 m alt';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BW8S'; % Cat of Life
metaData.links.id_ITIS = '668367'; % ITIS
metaData.links.id_EoL = '1048102'; % Ency of Life
metaData.links.id_Wiki = 'Cynops_pyrrhogaster'; % Wikipedia
metaData.links.id_ADW = 'Cynops_pyrrhogaster'; % ADW
metaData.links.id_Taxo = '47277'; % Taxonomicon
metaData.links.id_WoRMS = '1346233'; % WoRMS
metaData.links.id_amphweb = 'Cynops+pyrrhogaster'; % AmphibiaWeb
metaData.links.id_AnAge = 'Cynops_pyrrhogaster'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynops_pyrrhogaster,}}';
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
bibkey = 'UedaMaru2000'; type = 'Article'; bib = [ ...  
'doi = {10.1163/156853800507444}, ' ...
'author = {Ueda, Hiroaki and Marunouchi, Junsuke and Ochi, Osamu}, ' ...
'year = {2000}, ' ...
'title  = {Variation in age and size among breeding populations at different altitudes in the {J}apanese newts, \emph{Cynops pyrrhogaster}}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volme = {21(3)}, ' ...
'pages = {381–396}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Salamandrella&where-species=keyserlingii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Salamandrella_keyserlingii,}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

