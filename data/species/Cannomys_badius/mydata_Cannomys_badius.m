function [data, auxData, metaData, txtData, weights] = mydata_Cannomys_badius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Spalacidae';
metaData.species    = 'Cannomys_badius'; 
metaData.species_en = 'Lesser bamboo rat'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
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

data.tg = 42;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 61;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.8*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EiseMali1973';
data.Wwi = 650;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EiseMali1973';

data.Ri  = 3*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 pups per litter; 3 litters per yr assumed';
  
% univariate data

% time-weight
data.tWw = [ ...
0.334	7.301
10.971	21.951
21.954	35.386
32.603	41.520
40.150	53.722
50.438	72.020
58.661	92.741
64.812	119.534
73.724	139.042
85.386	158.563
94.992	173.208
104.936	192.721
116.274	197.642
129.320	211.087
138.917	231.814
149.203	252.545
161.212	269.635
173.218	289.157
184.546	301.378
196.559	316.034
208.917	329.476
223.681	342.929
237.768	349.080
248.426	349.131];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EiseMali1973';  
   
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
metaData.links.id_CoL = 'QM9K'; % Cat of Life
metaData.links.id_ITIS = '632757'; % ITIS
metaData.links.id_EoL = '1179535'; % Ency of Life
metaData.links.id_Wiki = 'Cannomys_badius'; % Wikipedia
metaData.links.id_ADW = 'Cannomys_badius'; % ADW
metaData.links.id_Taxo = '62566'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000019'; % MSW3
metaData.links.id_AnAge = 'Cannomys_badius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cannomys_badius}}';
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
bibkey = 'EiseMali1973'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.1973.tb02149.x}, ' ...
'author = {Eisenberg, J. F. and Maliniak, E.}, ' ... 
'year = {1973}, ' ...
'title = {Breeding and captive maintenance of the Lesser bamboo rat \emph{Cannamys badius}}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {13(1)}, ' ...
'pages = {204–207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Cannomys_badius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

