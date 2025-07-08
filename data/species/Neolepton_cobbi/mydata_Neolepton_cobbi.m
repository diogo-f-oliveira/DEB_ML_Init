function [data, auxData, metaData, txtData, weights] = mydata_Neolepton_cobbi

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Neoleptonidae';
metaData.species    = 'Neolepton_cobbi'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MN','MAN','MAb','MAm','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mn'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 06]; 

%% set data
% zero-variate data

data.am = 14*30.5; units.am = 'd';    label.am = 'life span'; bibkey.am = 'ItuaPres2017';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.026; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ItuaPres2017';
data.Lp  = 0.13; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'ItuaPres2017';
  comment.Lp = 'no females found below 1.3 mm; males changes to females in the full size spectrum';
data.Li  = 0.42;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'ItuaPres2017';
  comment.tL = 'based on tL data';

data.Wwi = 0.0173; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Chamelea_gallina: 19.9*(0.42/4.4)^3';

% uni-variate data

% time-length 
data.tL = [ ... % time since birth (d), shell length (cm)
137.204	0.046
199.047	0.074
258.713	0.098
290.197	0.118
365+15.114	0.157
365+46.507	0.148
365+106.721	0.174
365+136.501	0.169
365+197.254	0.195
365+259.626	0.218
365+290.574	0.240
730+14.853	0.248
730+46.866	0.264
730+107.024	0.272
730+138.417	0.263];
data.tL(:,1) = data.tL(:,1)-40; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ItuaPres2017';
comment.tL = 'Data from Puerto Deseado, Argentina';

% length-fecundity
data.LN = [ ... % shell length (cm), number of embryos (#)
0.167	13.180
0.173	12.376
0.180	24.501
0.180	13.683
0.186	22.114
0.194	14.449
0.194	21.309
0.199	22.090
0.200	11.008
0.206	17.855
0.221	24.952
0.221	5.954
0.227	36.814
0.227	28.370
0.234	31.788
0.240	39.691
0.241	38.371
0.241	54.730
0.241	26.761
0.247	72.923
0.253	38.347
0.254	27.792
0.261	55.219
0.267	56.791
0.274	29.074
0.274	61.264
0.274	59.944
0.275	51.499
0.280	45.156
0.280	61.251
0.281	96.606
0.281	53.598
0.287	50.948
0.288	80.499
0.294	56.740];
units.LN   = {'cm', '#'};  label.LN = {'shell length', 'fecundity'};  
temp.LN    = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ItuaPres2017';
comment.LN = 'Data from Puerto Deseado, Argentina';
    

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperatures in C for tL data varies in time in d as T(t)=9+5*sin(2*pi*(t-120)/365);';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Eggs/embryos in upto 3 capsules laid on the shell';
metaData.bibkey.F1 = 'ItuaPres2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46KNS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46470251'; % Ency of Life
metaData.links.id_Wiki = 'Neolepton'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3971224'; % Taxonomicon
metaData.links.id_WoRMS = '505222'; % WoRMS
metaData.links.id_molluscabase = '505222'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ItuaPres2017'; type = 'Article'; bib = [ ... 
'doi = {10.1093/mollus/eyx023}, ' ...
'author = {Cristi\''{a}n Ituarte and Mar\''{i}a Laura Presta}, ' ... 
'year = {2017}, ' ...
'title = {Fecundity and timing of oogenesis at high latitudes: reproductive traits in the brooding bivalve \emph{Neolepton cobbi} ({C}yamioidea: {N}eoleptonidae)}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'volume = {83}, ' ...
'pages = {340-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

