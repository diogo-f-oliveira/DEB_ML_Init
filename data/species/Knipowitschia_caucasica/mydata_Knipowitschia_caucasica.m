function [data, auxData, metaData, txtData, weights] = mydata_Knipowitschia_caucasica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Knipowitschia_caucasica'; 
metaData.species_en = 'Caucasian dwarf goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMc', '0iMm', 'jiFr', 'jiFm'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 2*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(17.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 2.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
  comment.Lp = '2 to 2.3 cm';
data.Li  = 4.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'fishbase';
  comment.Li = 'taken a bit smaller then for males, in view of tL data';
data.Lim  = 5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';     bibkey.Lim  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), total length (cm)
    0 2.8
    1 3.4
    2 3.9];
data.tL_f(:,1) = (0.85 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GucuErdo2017';
comment.tL_f = 'data for females';
%
data.tL_m = [... %  yr class (yr), total length (cm)
    0 2.9
    1 3.6
    2 4.0
    3 4.4];
data.tL_m(:,1) = (0.85 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(17.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GucuErdo2017';
comment.tL_m = 'data for males';


% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
2.308	0.134
2.416	0.226
2.454	0.180
2.462	0.205
2.469	0.158
2.500	0.143
2.508	0.220
2.554	0.189
2.577	0.266
2.584	0.168
2.615	0.208
2.623	0.162
2.646	0.171
2.669	0.242
2.676	0.291
2.676	0.239
2.699	0.263
2.699	0.202
2.707	0.217
2.745	0.263
2.753	0.276
2.753	0.242
2.761	0.186
2.761	0.217
2.784	0.288
2.807	0.356
2.814	0.174
2.814	0.205
2.822	0.239
2.822	0.294
2.830	0.500
2.830	0.260
2.837	0.313
2.853	0.156
2.853	0.337
2.868	0.183
2.876	0.356
2.876	0.285
2.883	0.260
2.883	0.294
2.883	0.331
2.906	0.208
2.906	0.193
2.906	0.279
2.937	0.368
2.945	0.208
2.945	0.242
2.945	0.254
2.945	0.279
2.960	0.193
2.960	0.313
2.960	0.353
2.968	0.420
2.983	0.260
2.991	0.340
2.998	0.313
2.998	0.386
3.006	0.334
3.014	0.276
3.021	0.297
3.029	0.350
3.037	0.180
3.037	0.205
3.037	0.230
3.044	0.396
3.060	0.442
3.083	0.368
3.090	0.430
3.098	0.516
3.098	0.254
3.098	0.291
3.098	0.223
3.098	0.334
3.098	0.350
3.106	0.242
3.113	0.482
3.129	0.402
3.129	0.208
3.137	0.270
3.152	0.448
3.152	0.420
3.160	0.313
3.175	0.334
3.183	0.510
3.183	0.257
3.183	0.300
3.183	0.362
3.190	0.448
3.190	0.242
3.206	0.488
3.213	0.384
3.221	0.500
3.221	0.251
3.244	0.313
3.252	0.411
3.252	0.227
3.252	0.257
3.252	0.347
3.259	0.464
3.259	0.427
3.267	0.402
3.275	0.448
3.282	0.544
3.282	0.488
3.282	0.325
3.290	0.522
3.305	0.282
3.313	0.341
3.313	0.374
3.328	0.267
3.328	0.233
3.336	0.430
3.336	0.297
3.344	0.544
3.344	0.476
3.359	0.445
3.359	0.417
3.374	0.288
3.374	0.254
3.374	0.214
3.374	0.362
3.390	0.568
3.390	0.590
3.397	0.497
3.397	0.473
3.397	0.494
3.405	0.402
3.413	0.525
3.413	0.310
3.428	0.587
3.428	0.544
3.428	0.424
3.436	0.439
3.436	0.307
3.443	0.654
3.466	0.498
3.474	0.525
3.489	0.547
3.497	0.458
3.497	0.599
3.520	0.661
3.520	0.399
3.528	0.464
3.528	0.501
3.528	0.374
3.528	0.359
3.535	0.538
3.558	0.451
3.558	0.550
3.558	0.593
3.558	0.341
3.574	0.636
3.581	0.701
3.589	0.611
3.589	0.485
3.597	0.531
3.635	0.519
3.643	0.630
3.643	0.571
3.650	0.685
3.650	0.658
3.650	0.470
3.673	0.516
3.689	0.735
3.689	0.599
3.696	0.682
3.704	0.562
3.712	0.793
3.712	0.402
3.719	0.301
3.735	0.707
3.735	0.442
3.742	0.624
3.742	0.559
3.742	0.528
3.750	0.584
3.788	0.501
3.804	0.747
3.811	0.661
3.819	0.630
3.834	0.772
3.834	0.452
3.842	0.673
4.018	0.562
4.049	0.756
4.149	0.849
4.149	0.824
4.248	0.864
4.264	0.944
4.387	1.058
4.601	1.083];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'GucuErdo2017';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
2.098	70.186
2.100	65.381
2.198	66.890
2.207	74.458
2.209	68.279
2.222	91.648
2.249	60.092
2.316	97.272
2.407	88.468
2.419	179.145
2.617	219.252
2.940	181.234];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(17.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KevrKokk1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperatures are guessed, ranging from 9.4 to 26.7 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6NM4S'; % Cat of Life
metaData.links.id_ITIS = '637541'; % ITIS
metaData.links.id_EoL = '46576381'; % Ency of Life
metaData.links.id_Wiki = 'Knipowitschia_caucasica'; % Wikipedia
metaData.links.id_ADW = 'Knipowitschia_caucasica'; % ADW
metaData.links.id_Taxo = '177762'; % Taxonomicon
metaData.links.id_WoRMS = '126899'; % WoRMS
metaData.links.id_fishbase = 'Knipowitschia-caucasica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Knipowitschia_caucasica}}';
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
bibkey = 'KevrKokk1990'; type = 'Article'; bib = [ ... 
'author = {T. Kevrekidis and A. K. Kokkinakis and A. Koukouras}, ' ... 
'year = {1990}, ' ...
'title = {Some aspects of the biology and ecology of \emph{Knipowitschia caucasica} ({T}eleostei: {G}obiidae) in the {E}vros {D}elta ({N}orth {A}egean {S}ea)}, ' ...
'journal = {Helgol\"{a}nder Meeresunters.}, ' ...
'volume = {44}, ' ...
'pages = {173-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GucuErdo2017'; type = 'Article'; bib = [ ... 
'author = {Salim Serkan G\"{u}\c{c}\"{u} and \"{O}mer Erdo\v{g}an}, ' ... 
'year = {2017}, ' ...
'title = {Age, growth, sex ratio and feeding of \emph{Knipowitschia caucasica} ({B}erg, 1916) ({A}ctinopterygii, {G}obiidae) in non-native species of {E}\v{g}irdir {L}ake ({T}urkey)}, ' ...
'journal = {Acta Biologica Turcica}, ' ...
'volume = {30}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Knipowitschia-caucasica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

