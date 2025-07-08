function [data, auxData, metaData, txtData, weights] = mydata_Mirounga_leonina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Mirounga_leonina'; 
metaData.species_en = 'Southern elephant seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCic', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2017 11 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data

data.tg = 220;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from Litt2006';
data.tx = 23;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1059;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
% data.tpm = 1825;  units.tpm = 'd';   label.tpm = 'time since birth at puberty  for males'; bibkey.tpm = 'AnAge';
%   temp.tpm = C2K(38.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 260;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';
  comment.Li = '2.6-3 m';
data.Lim  = 500;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '4.2 - 5.8 m';
  
data.Wwb = 42.5e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 125e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Wiki';
  comment.Wwx = '120-130 kg';
data.Wwi = 4.0e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 3.5e6; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-W data from Bryd1969 fro female, male
data.tW_f = [ ... % time since birth (yr), weight^1/3 (g^1/3)
0.268	46.154
0.673	50.556
0.730	45.369
0.818	53.406
1.193	49.770
1.367	51.582
1.426	59.101
2.493	53.638
3.303	58.811
3.449	67.626
3.534	56.993
3.535	61.920
3.708	64.769
3.767	69.177
4.576	69.682
6.511	72.244
6.625	64.981
7.405	65.747
7.435	70.673
8.330	66.250
10.293	65.700
10.554	70.882
12.374	71.630];
data.tW_f(:,1) = data.tW_f(:,1) * 365.25; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2).^3; % convert g^1/3 to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Bryd1969';
comment.tW_f = 'data for females';
% male
data.tW_m = [ ... % time since birth (yr), weight^1/3 (g^1/3)
0.240	47.192
0.615	46.148
1.137	58.587
1.280	48.990
2.321	59.346
2.465	59.084
3.274	59.849
3.418	53.883
3.535	61.401
4.169	53.870
4.286	63.204
4.546	67.349
4.575	65.792
4.662	70.459
4.982	79.789
5.357	76.153
6.776	100.506
6.833	96.096
8.512	115.777
15.912	154.815
16.922	149.612];
data.tW_m(:,1) = data.tW_m(:,1) * 365.25; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2).^3; % convert g^1/3 to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Bryd1969';
comment.tW_m = 'data for males';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} only';
D2 = ['Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration' ...
    'The male growth curve could fit better if puberty was dealed with as a period, rather than an event'];
D3 = 'In view of low somatic maintenance, k has been targeted to 0.1 and pseudodata for k_J removed';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'largest sex difference among mammals; can dive till 2.133 km ';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'gestation time of 11.5 month include 3-4 month delayed implantation';
metaData.bibkey.F2 = 'AnAge'; 
F3 = 'this entry is used in GoedMelb2018';
metaData.bibkey.F3 = 'GoedMelb2018'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '43MJ7'; % Cat of Life
metaData.links.id_ITIS = '180671'; % ITIS
metaData.links.id_EoL = '46559183'; % Ency of Life
metaData.links.id_Wiki = 'Mirounga_leonina'; % Wikipedia
metaData.links.id_ADW = 'Mirounga_leonina'; % ADW
metaData.links.id_Taxo = '67497'; % Taxonomicon
metaData.links.id_WoRMS = '231413'; % WoRMS
metaData.links.id_MSW3 = '14001049'; % MSW3
metaData.links.id_AnAge = 'Mirounga_leonina'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mirounga_leonina}}';
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
bibkey = 'Bryd1969'; type = 'Article'; bib = [ ... 
'author = {M. M. Bryden}, ' ... 
'year = {1969}, ' ...
'title = {Growth of the south elephant seal \emph{Mirounga leonina} ({L}inn.)}, ' ...
'journal = {Growth}, ' ...
'volume = {33}, ' ...
'pages = {69--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2014'; type = 'Article'; bib = [ ... 
'author = { S. A. L. M. Kooijman}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in animal ontogeny: an evolutionary perspective}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {128--137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Litt2006'; type = 'Article'; bib = [ ... 
'author = {Little, G. J.}, ' ... 
'year = {2006}, ' ...
'title = {BODY TEMPERATURE IN THE NEWBORN SOUTHERN ELEPHANT SEAL, \emph{Mirounga leonina}, AT {M}ACQUARIE {I}SLAND}, ' ...
'journal = {Marine mammals science}, ' ...
'volume = {11}, ' ...
'pages = {480--490}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mirounga_leonina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoedMelb2018'; type = 'Article'; bib = [ ... 
'title = {Modelling southern elephant seals \emph{Mirounga leonina} using an individual-based model coupled with a dynamic energy budget}, ' ...
'volume = {13}, ' ...
'issn = {1932-6203}, ' ...
'howpublished = {\url{http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0194950}},  ' ...
'doi = {10.1371/journal.pone.0194950}, ' ...
'pages = {e0194950}, ' ...
'number = {3}, ' ...
'journal = {PLOS ONE}, ' ...
'author = {Goedegebuure, M. and Melbourne-Thomas, J. and Corney, S. P. and McMahon, C. R. and Hindell, M. A.}, ' ...
'year = {2018}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

