function [data, auxData, metaData, txtData, weights] = mydata_Mya_arenaria

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Myidae';
metaData.species    = 'Mya_arenaria'; 
metaData.species_en = 'Soft-shell clam'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L';'t-Wd' ; 't-WdR'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'; 'Joana Cardoso'; 'Vania Freitas'};    
metaData.date_subm = [2009 07 29];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2011 09 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2015 12 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 27]; 


%% set data
% zero-variate data

data.ab = 2;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RoosRhod1980';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 291;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Card2007';   
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 10220; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MacDThom1980';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'FreiCard2009 gives 8030 d for Norway at 7C';

data.Lb  = 0.0165;   units.Lb  = 'cm';    label.Lb  = 'shell length at birth'; bibkey.Lb  = 'HendDure2005';
  comment.Lb = 'st 15C; LosaDavi1963 gives 0.009 cm at 22C';
data.Lp  = 2.34; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'CardWitt2009';
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Tebb1966';

data.Wdp = 0.03; units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Card2007';
data.Wdi = 22.3; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Card2007';
  comment.Wdi = 'computed from AFDW (mg) = 5.489 * shell length^3(cm^3)';

data.Ri  = 8219.2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'NeweHidu1986';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Brou1978 gives 120000 eggs per year for a 6cm female at 10C'; 

% uni-variate data

% L-W data
data.LW = [ ...
    2.761	0.321
2.959	0.402
3.054	0.737
3.168	0.397
3.315	0.774
3.366	0.519
3.502	0.643
3.575	0.642
3.690	0.976
3.742	0.722
3.763	0.975
3.825	0.805
3.941	1.308
4.097	1.179
4.265	1.723
4.337	1.300
4.369	1.426
4.390	1.678
4.514	1.338
4.537	1.928
4.661	1.588
4.746	2.177
4.859	1.711
4.891	2.005
4.943	1.793
4.996	2.087
5.019	3.056
5.152	2.126
5.122	2.717
5.145	3.433
5.269	3.093
5.245	1.998
5.403	2.374
5.444	2.288
5.499	3.341
5.563	3.635
5.581	2.876
5.738	2.957
5.916	3.501
5.991	4.216
6.619	5.088
6.677	7.111
7.099	9.125
7.348	8.699
7.439	7.558
7.517	9.454
7.359	12.535
7.464	12.659
7.746	12.990
7.676	10.420
7.780	10.334
7.972	11.763
7.967	10.161
8.008	10.034
8.390	12.429
8.706	13.687
9.018	13.301
10.015	15.852
9.166	17.640
9.615	21.636];
units.LW   = {'cm', 'g'};  label.LW = {'shell length', 'somatic wet weight'};  
bibkey.LW = 'Card2007';

% t-L data
data.tL = [ ... % time since birth (a), shell weight (g)
0.605	1.092
0.711	3.515
0.754	1.413
0.981	4.433
1.046	3.563
1.204	3.841
1.281	4.480
1.368	4.800
1.439	4.864
1.473	5.098
1.566	3.762
1.600	4.251
1.613	5.355
1.852	5.189
1.908	4.468
2.064	5.107
2.143	5.342
2.212	5.874
2.308	5.982
2.426	5.155
2.457	6.430
2.725	5.436
2.778	5.479
2.926	6.161
2.993	6.948
3.056	6.588
3.100	6.674
3.161	6.908
3.302	6.995
3.553	8.401
3.619	7.191
3.783	8.277
3.855	7.768
3.912	9.192
4.005	7.962
4.031	8.089
4.039	8.281
4.111	7.751
4.108	8.792
4.171	8.410
4.399	8.902
4.499	7.905
4.636	9.118
4.718	8.503
4.786	9.205
4.849	8.930
4.910	9.144
4.999	8.890
5.047	10.250
5.352	8.917
5.524	10.151
5.578	9.791
5.738	9.453
5.781	9.836
6.475	10.845
6.610	9.934];
data.tL(:,1) = 365 * data.tL(:,1); % convert a to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Card2007';
comment.tL = 'Intertidal polulation';

% t-somatic mass data
data.tW = [ ... % time since birth (a), somatic ashfree dry weight (g)
0.586	0.032
0.670	0.199
0.729	0.047
1.035	0.194
1.199	0.334
1.248	0.583
1.331	0.778
1.412	0.647
1.451	0.765
1.530	0.267
1.563	0.419
1.581	0.884
1.834	0.643
1.899	0.408
2.060	0.790
2.116	0.936
2.192	1.366
2.261	1.283
2.311	1.380
2.402	0.751
2.447	1.492
2.681	0.850
2.767	0.781
2.923	1.170
2.972	1.994
3.060	1.766
3.121	1.947
3.161	1.899
3.303	1.962
3.521	2.975
3.605	1.957
3.744	2.872
3.828	2.464
3.885	3.725
3.964	2.569
3.973	2.749
4.006	2.936
4.098	2.251
4.093	3.387
4.148	3.007
4.360	3.444
4.450	2.372
4.595	3.266
4.685	2.796
4.765	3.371
4.803	3.586
4.865	3.621
4.957	3.532
4.988	4.584
5.326	3.105
5.479	3.791
5.531	4.900
5.692	4.811
5.734	4.576
6.399	5.938
6.575	4.762];  
data.tW(:,1) = 365 * data.tW(:,1); % convert a to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'somatic ashfree dry weight'};  
temp.tW    = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Card2007';
comment.tW = 'Intertidal polulation';

% t-gonadal mass data
data.tWR = [ ... % time since birth (d), wet weight (g)
0.592	0.006
0.695	0.005
0.780	0.004
1.052	0.006
1.212	0.004
1.278	0.087
1.391	0.081
1.447	0.054
1.513	0.080
1.588	0.017
1.691	0.042
1.917	0.004
1.973	0.008
2.114	0.073
2.170	0.169
2.255	0.291
2.330	0.237
2.358	0.303
2.481	0.007
2.509	0.262
2.753	0.000
2.828	0.012
3.016	0.164
3.082	0.453
3.148	0.479
3.213	0.430
3.242	0.689
3.411	0.309
3.617	1.128
3.693	0.741
3.881	0.387
3.956	0.527
4.012	0.904
4.106	0.525
4.144	0.775
4.238	0.589
4.256	0.963
4.482	1.343
4.576	0.814
4.773	0.495
4.820	0.517
4.858	1.400
4.961	0.766
5.036	0.809
5.036	1.921
5.168	0.500
5.412	1.416
5.628	0.868
5.685	1.061
5.807	1.381
5.835	1.776
6.530	1.720
6.718	1.449];  
data.tWR(:,1) = 365 * data.tWR(:,1); % convert a to d
units.tWR   = {'d', 'g'};  label.tWR = {'time since birth', 'gonadic ashfree dry weight'};  
temp.tWR    = C2K(12);  units.temp.tWR = 'K'; label.temp.tWR = 'temperature';
bibkey.tWR = 'Card2007';
comment.tWR = 'Intertidal polulation';

%% set weights for all real data
weights = setweights(data, []);
weights.tWR(data.tWR(:,2) < .01) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This entry is discussed in Card2007, FreiCard2010';
metaData.bibkey.F1 = {'Card2007', 'FreiCard2010', 'FreiCard2009'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44RHY'; % Cat of Life
metaData.links.id_ITIS = '81692'; % ITIS
metaData.links.id_EoL = '46470499'; % Ency of Life
metaData.links.id_Wiki = 'Mya_arenaria'; % Wikipedia
metaData.links.id_ADW = 'Mya_arenaria'; % ADW
metaData.links.id_Taxo = '39960'; % Taxonomicon
metaData.links.id_WoRMS = '140430'; % WoRMS
metaData.links.id_molluscabase = '140430'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mya_arenaria}}';
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
bibkey = 'Card2007'; type = 'Phdthesis'; bib = [ ... 
'author = {Cardoso, J. F. M. F.}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction in bivalves; {A}n energy budget approach}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2010'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardosa, J. M. F. and Lika, D. and Peck, M. and Campos, J. and Kooijman, S. A. L. M. and Veer, H. W.van der}, ' ... 
'year = {2010}, ' ...
'title = {Temperature tolerance and energetics, a {D}ynamic {E}nergy {B}udget-based comparison of {N}orth {A}tlantic marine species}, ' ...
'journal = {Phil. Trans. R. Soc. B}, ' ...
'volume = {365}, ' ...
'pages = {3553--3565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoosRhod1980'; type = 'Article'; bib = [ ... 
'author = {Roosenburg, W. H. and Rhoderick, J. C. and Block, R. M. and Kennedy, V. S. and Vreenegoor, S. M.}, ' ... 
'year = {1980}, ' ...
'title = {Survival of \emph{Mya arenaria} larvae ({M}ollusca: {B}ivalvia) exposed to chlorine-produced oxidants}, ' ...
'journal = {Proc. Nat. Shellfish. Assoc.}, ' ...
'volume = {70}, ' ...
'pages = {105--111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HendDure2005'; type = 'Article'; bib = [ ... 
'author = {Hendriks, I. E. and van Duren, L. A. and Herman, P. M. J.}, ' ... 
'year = {2005}, ' ...
'title = {Image analysis techniques: A tool for the identification of bivalve larvae?}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {54}, ' ...
'pages = {151--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LoosDavi1963'; type = 'Incollection'; bib = [ ... 
'author = {Loosanoff, V. L. and Davis, H. C.}, ' ... 
'year = {1963}, ' ...
'title = {Rearing of bivalve mollusks}, ' ...
'booktitle = {Advances in Marine Biology}, ' ...
'editor = {Russell, F. S.}, ' ... 
'publisher = {Academic Press}, '...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RiccBour1998'; type = 'Article'; bib = [ ... 
'author = {Ricciardi, A. and Bourget, E.}, ' ... 
'year = {1998}, ' ...
'title = {Weight-to-weight conversion factors for marine benthic macroinvertebrates}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {163}, ' ...
'pages = {245--251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tebb1966'; type = 'Book'; bib = [ ... 
'author = {Tebble, N.}, ' ... 
'year = {1966}, ' ...
'title = {British bivalve seashells: a handbook identification}, ' ...
'publisher = {British Museum (Natural History)}, ' ...
'address = {Lonadon}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CardWitt2009'; type = 'Article'; bib = [ ... 
'author = {Cardoso, J. F. M. F. and Witte, J. I. and Van der Veer, H. W.}, ' ... 
'year = {2009}, ' ...
'title = {Differential reproductive strategies of two bivalves in the {D}utch {W}adden {S}ea {E}stuary}, ' ...
'journal = {Coast. Shelf Sci.}, ' ...
'volume = {84}, ' ...
'pages = {37--44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NeweHidu1986'; type = 'Article'; bib = [ ... 
'author = {Newell, C. R. and Hidu, H.}, ' ... 
'year = {1986}, ' ...
'title = {Species profiles: Life histories and environmental requirements of coastal fish and invertebrates ({N}orth {A}tlantic) - shoftshell clam}, ' ...
'journal = {U.S. Fish Wildl. Serv. Biol. Rep.}, ' ...
'volume = {82}, ' ...
'number = {11.53}, '...
'publisher = {U.S. Army Corps of Engineers, TR EL-82-4}, ' ...
'pages = {17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brou1978'; type = 'Article'; bib = [ ... 
'author = {Brousseau, D. J.}, ' ... 
'year = {1978}, ' ...
'title = {Spawning cycle, fecundity and recruitment in a population of \emph{Mya arenaria} (soft-shell clam) from {C}ape {A}nn, {M}assachusetts}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {76}, ' ...
'pages = {155--166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2009'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardoso, J. F. M. F., Santos, S. and Campos, J. and Drent, J. and Saraiva, S. and Witte, J. I. and Kooijman, S. A. L. M. and Van der Veer, H. W.}, ' ... 
'year = {2009}, ' ...
'title = {Reconstruction of food conditions for {N}ortheast {A}tlantic bivalve species based on {D}ynamic {E}nergy {B}udgets}, ' ...
'journal = {J. Sea Res}, ' ...
'volume = {62}, ' ...
'pages = {75--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDThom1980'; type = 'Article'; bib = [ ... 
'author = {MacDonald, B. A. and Thomas, M. L. H. }, ' ...
'title = {Age determination of the soft-shell clam \emph{Mya arenaria} using shell internal growth lines}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {58}, ' ...
'pages = {105--109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

