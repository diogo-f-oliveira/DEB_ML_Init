function [data, auxData, metaData, txtData, weights] = mydata_Eptesicus_fuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Eptesicus_fuscus'; 
metaData.species_en = 'Big brown bat'; 

metaData.ecoCode.climate = {'A', 'B', 'Cfa', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data
data.tg = 35;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tp = 547;    units.tp = 'd';    label.tp = 'age at puberty for female';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'age at puberty for male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19*365;    units.am = 'd';    label.am = 'life span, guessed';       bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwx = 17.2; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of females'; bibkey.Wwi = 'EoL';
  comment.Wwi = 'EoL: females somewhat heavier than males, on average 23 g';
data.Wwim = 20;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'EoL';
  comment.Wwim = 'EoL: females somewhat heavier than males, on average 23 g';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 2 pups per litters'; 

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.551	4.261
0.661	3.832
0.717	2.830
0.717	2.944
0.717	3.288
0.717	3.689
0.772	3.431
0.772	4.318
0.772	5.521
1.543	5.492
1.598	5.749
1.654	2.772
1.654	2.915
1.654	3.974
1.654	4.489
1.709	4.375
1.764	3.258
1.819	3.373
1.819	3.630
1.819	5.234
1.874	4.833
3.638	2.970
3.638	5.290
3.693	4.058
3.693	6.206
3.693	6.435
3.748	3.371
3.748	5.604
3.748	5.919
4.575	6.033
4.740	6.291
4.740	6.520
4.740	6.749
4.740	6.921
4.795	4.945
4.795	5.346
4.795	7.407
5.787	7.292
6.669	4.543
6.724	4.800
6.724	5.230
6.724	5.344
6.724	5.545
6.724	5.688
6.724	6.232
6.780	5.945
7.661	7.720
7.661	7.949
7.772	5.086
9.701	8.720
9.866	9.951
10.748	8.748
10.748	9.893
10.803	8.519
10.803	9.349
10.858	8.977
11.740	9.377
11.795	8.318
11.795	8.690
11.795	8.947
12.677	9.433
12.843	8.145
12.843	8.603
13.890	9.318
14.717	8.315
14.827	10.835
15.654	8.057
15.764	9.116
17.803	8.885
17.858	10.145
18.740	8.885
20.835	9.570
20.835	9.942
20.890	12.261
21.717	9.283
22.709	9.941
22.764	11.630
23.921	9.997
23.921	10.255
25.906	9.251
25.906	11.284
26.567	11.856
30.921	14.457
33.843	13.195
34.063	14.598
34.945	9.472
35.882	11.963
36.984	13.078];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(36);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'HoodBlos2002';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.717	3.402
0.772	4.204
1.709	2.714
3.638	4.889
3.693	3.171
3.748	3.743
4.740	5.174
4.740	5.661
6.724	4.371
6.724	7.377
7.772	7.262
7.827	7.634
8.598	5.314
8.764	6.087
8.764	6.660
8.764	6.860
8.764	7.032
8.764	9.752
8.819	8.005
8.819	8.206
9.756	9.693
9.811	8.892
10.748	8.204
11.575	7.688
11.795	9.921
12.677	7.687
12.677	6.513
13.614	6.713
13.724	6.942
13.724	8.259
14.717	8.544
14.772	9.747
15.764	7.684
15.764	8.858
15.819	7.255
17.748	8.198
17.969	9.343
18.575	10.030
19.732	9.714
19.732	7.424
19.843	10.286
20.669	7.967
21.827	9.540
21.882	9.855
23.701	11.629
23.811	9.253
23.811	8.909
24.858	7.677
25.850	10.024
26.843	9.909
26.898	9.107
31.803	10.792
31.913	9.675
32.961	10.362
32.961	12.423
33.787	12.995
33.953	14.054
34.835	9.959
35.827	10.188
35.882	11.275
35.992	13.451
35.992	12.277
36.102	12.564
36.764	10.015
36.984	11.475
38.858	12.762];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(36);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'HoodBlos2002';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'diapause (at start of gestation)';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'High value for tp cannot be captured by the stx model with constant temperature; winter torpor probably contributes to tp';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7TKL8'; % Cat of Life
metaData.links.id_ITIS = '180008'; % ITIS
metaData.links.id_EoL = '327553'; % Ency of Life
metaData.links.id_Wiki = 'Eptesicus_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Eptesicus_fuscus'; % ADW
metaData.links.id_Taxo = '168011'; % Taxonomicon
metaData.links.id_MSW3 = '13801829'; % Mammal Spec World
metaData.links.id_AnAge = 'Eptesicus_fuscus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Big_brown_bat}}'];
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
bibkey = 'HoodBlos2002'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0952836902001504}, ' ...
'author = {W. R. Hood and J. Bloss and T. H. Kunz}, ' ...
'title = {Intrinsic and extrinsic sources of variation in size at birth and rates of postnatal growth in the big brown bat \emph{Eptesicus fuscus} ({C}hiroptera: {V}espertilionidae)}, ' ...
'journal = {J. Zool., Lond.}, ', ...
'year = {2002}, ' ...
'volume = {258}, ', ...
'pages = {355-363}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eptesicus_fuscus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{http://eol.org/pages/327553/details}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

