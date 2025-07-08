function [data, auxData, metaData, txtData, weights] = mydata_Cystophora_cristata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Cystophora_cristata'; 
metaData.species_en = 'Hooded seal'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCik', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 02 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 20]; 

%% set data
% zero-variate data

data.tg = 240;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 7;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 1826;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(38.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MillJone1999';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 100;   units.Lb  = 'cm';  label.Lb  = 'length at birth';                    bibkey.Lb  = 'Wiki';
data.Li  = 203;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';
data.Lim  = 260;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';
  
data.Wwb = 18e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 43.3e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 300e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 405e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data for male
data.tL_m = [ ... % time since birth (yr), length (cm)
0.058	111.413
0.088	112.717
0.088	118.587
0.613	122.500
0.642	100.000
0.729	127.065
0.846	112.717
0.846	118.587
0.846	121.196
1.634	134.239
1.692	124.130
1.896	150.870
1.925	158.043
2.100	126.413
2.130	135.870
2.596	168.804
2.655	150.543
2.800	160.000
2.917	164.891
2.917	182.500
3.063	161.957
3.063	172.065
3.763	175.978
3.821	199.457
3.880	150.543
3.880	168.152
3.967	165.543
4.026	182.500
4.055	186.087
4.113	192.935
4.901	191.630
5.047	182.500
5.047	169.457
5.047	158.043
5.047	202.717
5.076	177.935
5.076	172.391
5.134	187.391
6.068	202.391
6.068	205.326
6.068	194.891
6.068	184.457
6.068	180.217
6.155	205.326
6.826	190.652
6.972	238.587
7.030	197.826
7.030	202.065
7.905	200.435
7.935	221.957
7.935	222.935
7.964	231.739
8.081	196.196
8.081	198.152
8.081	213.804
8.897	237.935
9.043	210.870
9.043	202.065
9.043	200.435
9.072	239.565
9.977	216.087
10.064	187.391
10.064	214.130
10.968	235.978
11.027	232.065
11.056	200.761
11.960	235.978
11.989	229.457
12.077	224.239
14.032	222.609
14.994	228.478
14.994	240.870
15.053	255.543
17.095	265.000
19.078	221.304
19.953	248.370
21.062	258.478];
data.tL_m(:,1) = data.tL_m(:,1) * 365.25; % convert yr to d
units.tL_m   = {'yr', 'cm'};  label.tL_m = {'time since birth', 'length'};  
temp.tL_m    = C2K(38.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MillJone1999';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 10 * weights.tL_m;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} and E_Hp only';
D2 = 'BowOftd1985 report very fast growth from birth to weaning, which is not captured with single food';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '33PXN'; % Cat of Life
metaData.links.id_ITIS = '180657'; % ITIS
metaData.links.id_EoL = '46559152'; % Ency of Life
metaData.links.id_Wiki = 'Cystophora_cristata'; % Wikipedia
metaData.links.id_ADW = 'Cystophora_cristata'; % ADW
metaData.links.id_Taxo = '67494'; % Taxonomicon
metaData.links.id_WoRMS = '137078'; % WoRMS
metaData.links.id_MSW3 = '14001030'; % MSW3
metaData.links.id_AnAge = 'Cystophora_cristata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cystophora_cristata}}';
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
bibkey = 'MillJone1999'; type = 'Article'; bib = [ ... 
'author = {E. H. Miller and I. L. Jones and G. B. Stenson}, ' ... 
'year = {1999}, ' ...
'title = {Baculum and testes of the hooded seal (\emph{Cystophora cristata}): growth and size-scaling and their relationships to sexual selection}, ' ...
'journal = {Can.  J.  Zool.}, ' ...
'volume = {77}, ' ...
'pages = {470-479}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BowOftd1985'; type = 'Article'; bib = [ ... 
'author = {Bowen, W. D. and Oftedal, O. T. and Boness, D. J.}, ' ... 
'year = {1985}, ' ...
'title = {Birth to weaning in 4 days: remarkable growth in the hooded seal, \emph{Cystophora cristata}}, ' ...
'journal = {Can.  J.  Zool.}, ' ...
'volume = {63}, ' ...
'pages = {2841-2846}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cystophora_cristata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Cystophora_cristata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


