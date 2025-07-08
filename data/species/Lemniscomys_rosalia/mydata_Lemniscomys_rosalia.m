function [data, auxData, metaData, txtData, weights] = mydata_Lemniscomys_rosalia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Lemniscomys_rosalia'; 
metaData.species_en = 'Single-striped grass mouse'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 17];              

%% set data
% zero-variate data

data.tg = 24;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ScotMees1988';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ScotMees1988';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 148;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(38.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lemniscomys_striatus';
data.am = 4.8*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Lemniscomys_striatus';

data.Wwb = 2.6;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ScotMees1988';
  comment.Wwb = '6.1-9.6 g';
data.Wwi = 42;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Lemniscomys_striatus';

data.Ri  = 4.2*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ScotMees1988';   
  temp.Ri = C2K(38.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.2 pups per litter; assumed 6 litter per yr assumed';

% univariate data
data.tWw = [ ... % time since birth (d), weight (g)
0.154	2.588
1.992	3.332
3.259	3.827
4.783	4.762
5.991	5.700
7.449	6.320
9.096	6.939
9.673	7.818
10.564	8.569
11.961	9.442
13.226	9.685
14.370	10.497
16.402	11.744
17.991	12.869
19.075	13.997
19.975	15.569
21.494	15.999
23.276	17.500
25.115	18.370
26.834	19.809
27.979	20.748
29.125	21.749
31.215	22.490
32.115	24.062
33.322	24.874
34.214	25.688
35.419	26.247
36.314	27.440
37.328	27.874
37.966	28.500
38.794	29.252
39.939	30.127
41.083	30.939
42.104	32.004
43.249	32.943
45.089	33.939];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'ScotMees1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3T4V3'; % Cat of Life
metaData.links.id_ITIS = '585277'; % ITIS
metaData.links.id_EoL = '1179125'; % Ency of Life
metaData.links.id_Wiki = 'Lemniscomys_rosalia'; % Wikipedia
metaData.links.id_ADW = 'Lemniscomys_rosalia'; % ADW
metaData.links.id_Taxo = '63001'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001414'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lemniscomys_rosalia}}';
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
bibkey = 'ScotMees1988'; type = 'Article'; bib = [ ... 
'author = {E. D. Scott and J. Meester}, ' ... 
'year = {1988}, ' ...
'title = {Reproduction and postnatal development of the single-striped mouse, \emph{Lemniscomys_rosalia}}, ' ...
'journal = {S.-Afr. Tydskr. Natuurnav.}, ' ...
'volume = {18(4)}, ' ...
'pages = {137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

