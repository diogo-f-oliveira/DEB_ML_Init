function [data, auxData, metaData, txtData, weights] = mydata_Rhinolophus_hipposideros

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Rhinolophidae';
metaData.species    = 'Rhinolophus_hipposideros'; 
metaData.species_en = 'Lesser horseshoe bat'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 29]; 

%% set data
% zero-variate data

data.tg = 67;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 500;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 471;    units.tpm = 'd';    label.tpm = 'time since birth at first litter male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(34.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 22.4*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 4.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.000	1.900
0.063	2.138
0.125	2.009
0.125	2.070
1.004	2.199
1.004	2.260
1.004	2.355
1.129	2.016
1.129	2.470
2.007	2.273
2.885	2.606
3.011	2.741
3.011	2.829
3.073	2.653
4.014	3.006
4.014	3.101
4.140	2.612
4.140	2.829
4.955	2.958
4.955	3.060
4.955	3.128
6.022	2.558
6.022	3.108
6.022	3.264
6.962	3.508
7.025	3.657
7.213	3.209
8.029	3.318
8.029	3.609
8.091	3.460
9.032	3.711
10.036	3.413
10.036	3.569
10.036	3.664
10.036	3.772
10.977	3.467
10.977	3.535
11.039	3.881
11.102	3.725
11.102	3.806
11.918	3.806
11.918	3.908
12.043	3.718
12.921	4.064
13.047	3.996
13.925	3.508
13.925	3.996
13.987	3.908
13.987	4.071
14.050	3.711
14.050	3.813
14.991	3.806
14.991	4.003
14.991	4.105
16.057	4.505
16.935	3.562
16.935	3.616
16.935	3.860
16.998	3.250
17.061	4.010
18.002	4.647
18.065	3.664
18.065	4.050
18.943	4.057
19.005	4.756
19.946	3.297
20.009	4.016
20.072	3.752
20.072	3.806
21.013	3.854
21.013	4.315
22.016	4.702
23.020	4.410
23.082	4.634
23.961	4.512
23.961	4.159
25.968	4.213
25.968	3.609
28.978	3.365
30.045	4.654];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Reit2004';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwb = 50 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '4S97S'; % Cat of Life
metaData.links.id_ITIS = '631434'; % ITIS
metaData.links.id_EoL = '328775'; % Ency of Life
metaData.links.id_Wiki = 'Rhinolophus_hipposideros'; % Wikipedia
metaData.links.id_ADW = 'Rhinolophus_hipposideros'; % ADW
metaData.links.id_Taxo = '64130'; % Taxonomicon
metaData.links.id_WoRMS = '1049409'; % WoRMS
metaData.links.id_MSW3 = '13800555'; % MSW3
metaData.links.id_AnAge = 'Rhinolophus_hipposideros'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinolophus_hipposideros}}';
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
bibkey = 'Reit2004'; type = 'Article'; bib = [ ... 
'author = {G. Reiter}, ' ... 
'year = {2004}, ' ...
'title = {Postnatal growth and reproductive biology of \emph{Rhinolophus hipposideros} ({C}hiroptera: {R}hinolophidae)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {262}, ' ...
'pages = {231-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhinolophus_hipposideros}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

