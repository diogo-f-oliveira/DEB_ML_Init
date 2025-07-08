function [data, auxData, metaData, txtData, weights] = mydata_Peromyscus_interparietalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Peromyscus_interparietalis'; 
metaData.species_en = 'San Lorenzo mouse'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 05];              

%% set data
% zero-variate data

data.tg = 32;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'BranRyck1968';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Peromyscus_truei';
data.tx = 30;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Peromyscus_truei';
data.tp = 50;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Peromyscus_truei';
data.am = 5.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Peromyscus_truei';

data.Wwb = 2.315;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BranRyck1968';
data.Wwi = 26;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BranRyck1968';

data.Ri  = 2.4*12/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BranRyck1968';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 pups per litter; 12 litters per yr';
  
% univariate data

% time-weight
data.tWw = [ ...
0.000	2.799
2.335	3.686
4.327	4.474
6.484	5.262
8.559	5.952
10.882	6.707
13.537	7.560
15.860	8.183
18.018	8.971
20.176	9.858
22.085	10.745
24.243	11.698
26.650	12.519
29.139	13.372
31.545	14.028
34.117	14.816
36.523	15.505
39.012	16.259
41.086	16.751
43.823	17.374
46.643	17.997
49.462	18.520
52.615	19.307
56.263	19.830
59.911	20.189];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(36.7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BranRyck1968';  
   
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4F7KD'; % Cat of Life
metaData.links.id_ITIS = '633274'; % ITIS
metaData.links.id_EoL = '1180052'; % Ency of Life
metaData.links.id_Wiki = 'Peromyscus_interparietalis'; % Wikipedia
metaData.links.id_ADW = 'Peromyscus_interparietalis'; % ADW
metaData.links.id_Taxo = '88658'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000459'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Peromyscus_interparietalis}}';
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
bibkey = 'BranRyck1968'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1378208}, ' ...
'author = {Brand, L. R. and Ryckman, R. E.}, ' ... 
'year = {1968}, ' ...
'title = {Laboratory Life Histories of \emph{Peromyscus eremicus} and \emph{Peromyscus interparietalis}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {49(3)}, ' ...
'pages = {495-501}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

