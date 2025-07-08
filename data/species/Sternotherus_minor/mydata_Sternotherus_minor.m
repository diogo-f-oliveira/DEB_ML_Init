function [data, auxData, metaData, txtData, weights] = mydata_Sternotherus_minor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Sternotherus_minor'; 
metaData.species_en = 'Loggerhead musk turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 29];

%% set data
% zero-variate data

data.ab = 86;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'Beck2003';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '83-89 d';
data.tp = 8*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'CoxHaze1991';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 5.6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'CoxHaze1991';   
  temp.tpm = C2K(21);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 23.9*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.4;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'Wiki'; 
  comment.Lb = '2.2-2.8 cm straight carapace length';
data.Lp  = 8.0; units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'CoxHaze1991';
data.Li  = 14.5;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ADW';
data.Lim = 12;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'ADW';

data.Wwb = 4.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Beck2003';
  comment.Wwb = '3.3-4.8 g';
data.Wwi = 400; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'EoL';
data.Wwim = 280; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for females';   bibkey.Wwim = 'EoL';

data.Ri  = 3*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5  eggs per clutch, 1-5 clutch per yr';
 
% uni-variate data
% length-spec growth rate
data.Lr_f = [ ... % carapace length(0) (cm), log(carapace length(t)/ carapace lenght(0))/ t,  (1/yr)
4.0908	0.3432
4.2622	0.2367
4.3419	0.2212
4.3608	0.3122
4.4049	0.1255
4.7735	0.1038
4.8630	0.0689
4.8948	0.2222
4.9682	0.1763
4.9738	0.1366
4.9754	0.2113
5.0398	0.1888
5.0925	0.1764
5.2162	0.1064
5.5445	0.0240
5.5507	0.0536
5.6265	0.0863
5.6325	0.0482
5.7136	0.1066
5.8007	0.1269
5.8794	0.0397
6.2877	0.0765
6.4169	0.0999
6.4942	0.0727
6.5192	0.0602
6.5551	0.0999
6.6145	0.0533
6.9788	0.0776
7.0484	0.0799
7.0548	0.1111
7.2324	0.1010
7.4176	0.0614
7.5056	0.0864
7.5283	0.0622
7.6454	0.0942
7.8405	0.0351
7.8612	0.0686
7.9213	0.0920
8.0622	0.0384
8.0746	0.0314
8.0982	0.0788
8.1589	0.0384
8.4584	0.0167
8.5605	0.0425
8.8164	0.0107
8.9188	0.0379
8.9406	0.0099
9.0532	0.0201
9.0910	0.0022
9.4657	0.0102
9.8372	0.0026
10.0456	0.0081
10.4612	0.0137
10.9704	0.0038];
data.Lr_f(:,2) = data.Lr_f(:,2) * 3/ 365; % convert spec gro in length per yr to that in mass per d
units.Lr_f  = {'cm', '1/d'};  label.Lr_f = {'carapace length', 'specific growth rate', 'female'};  
temp.Lr_f   = C2K(21);  units.temp.Lr_f = 'K'; label.temp.Lr_f = 'temperature';
bibkey.Lr_f = 'CoxHaze1991';
comment.Lr_f = 'Data for females from Emerald Springs, 1976';
% 
data.Lr_m = [ ... % carapace length(0) (cm), log(carapace length(t)/ carapace lenght(0))/ t,  (1/yr)
4.4476	0.2115
4.5377	0.1398
4.5801	0.1506
4.5904	0.2625
4.7100	0.2109
4.8577	0.1639
5.3380	0.1278
5.4187	0.1047
5.4768	0.1348
5.4989	0.0747
5.5449	0.1241
5.5967	0.0871
5.6345	0.0478
5.6412	0.1195
5.8205	0.1165
5.8832	0.0471
5.8873	0.0918
5.9404	0.0687
5.9673	0.0602
6.0214	0.0479
6.0331	0.0240
6.0516	0.0749
6.0551	0.1135
6.1615	0.0688
6.2272	0.0318
6.3998	0.1059
6.4768	0.0412
6.5196	0.0559
6.5204	0.0651
6.6152	0.0443
6.6167	0.0605
6.7120	0.0444
6.7823	0.0575
6.8477	0.0182
6.8812	0.0822
6.9053	0.0429
6.9763	0.0645
7.0738	0.0731
7.0978	0.0330
7.0989	0.0453
7.2104	0.0554
7.2392	0.0685
7.3479	0.0485
7.4156	0.0331
7.4579	0.0424
7.7103	0.0826
7.7739	0.0232
7.9122	0.0248
8.0389	0.0503
8.4111	0.0405
8.4911	0.0097
8.9349	0.0268
9.3069	0.0162
9.6120	0.0279
9.7630	0.0172
9.9566	0.0188
10.1348	0.0034
11.6271	0.0049];
data.Lr_m(:,2) = data.Lr_m(:,2) * 3/ 365; % convert spec gro in length per yr to that in mass per d
units.Lr_m  = {'cm', '1/d'};  label.Lr_m = {'carapace length', 'specific growth rate', 'male'};  
temp.Lr_m   = C2K(21);  units.temp.Lr_m = 'K'; label.temp.Lr_m = 'temperature';
bibkey.Lr_m = 'CoxHaze1991';
comment.Lr_m = 'Data for males from Emerald Springs, 1976';

%% set weights for all real data
weights = setweights(data, []);
weights.Lr_f = 10 * weights.Lr_f;
weights.Lr_m = 10 * weights.Lr_m;
weights.Lb = 0 * weights.Lb;
%weights.Li = 3 * weights.Li;
%weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Lr_f','Lr_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males are born at T = 25-26 C, females at T <24 and >27 C';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);


%% Links
metaData.links.id_CoL = '52FSY'; % Cat of Life
metaData.links.id_ITIS = '208566'; % ITIS
metaData.links.id_EoL = '790516'; % Ency of Life
metaData.links.id_Wiki = 'Sternotherus_minor'; % Wikipedia
metaData.links.id_ADW = 'Sternotherus_minor'; % ADW
metaData.links.id_Taxo = '48318'; % Taxonomicon
metaData.links.id_WoRMS = '1037118'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sternotherus&species=minor'; % ReptileDB
metaData.links.id_AnAge = 'Sternotherus_minor'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sternotherus_minor}}';
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
bibkey = 'CoxHaze1991'; type = 'Article'; bib = [ ... 
'author = {William A. Cox and Jane B. Hazelrig and Malcolm E. Turner and Robert A. Aangus and Ken R. Marion}, ' ... 
'year = {1991}, ' ...
'title = {A Model for Growth in the Musk Turtle, \emph{Sternotherus minor}, in a {N}orth {F}lorida Spring}, ' ...
'journal = {Copeia}, ' ...
'volume = {1991(4)}, ' ...
'pages = {954-968}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beck2003'; type = 'Article'; bib = [ ... 
'author = {Herbert Becker}, ' ... 
'year = {2003}, ' ...
'title = {Comments on keeping and breeding the loggerhead Musk Turtle, \emph{Sternotherus minor minor} ({A}gassiz, 1857)}, ' ...
'journal = {Radiata}, ' ...
'volume = {12(1)}, ' ...
'pages = {3-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sternotherus_minor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/790516}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sternotherus_minor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

