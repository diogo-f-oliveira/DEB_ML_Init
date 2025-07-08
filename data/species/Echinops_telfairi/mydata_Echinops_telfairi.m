function [data, auxData, metaData, txtData, weights] = mydata_Echinops_telfairi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Afrosoricida'; 
metaData.family     = 'Tenrecidae';
metaData.species    = 'Echinops_telfairi'; 
metaData.species_en = 'Lesser hedgehog tenrec'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCiw'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 12 17]; 

%% set data
% zero-variate data

data.tg = 55;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 18-25 d';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(34.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7.67; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 50; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 180;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: 125-280 g';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter';
 
% uni-variate data
% time-weight data
data.tWw1 = [ ... % time since birth (w), weight (g)
0.701	11.398
6.220	12.924
12.904	19.876
19.719	27.102
24.854	41.009
29.158	42.495
33.898	55.312
41.084	66.322
51.412	87.672
57.671	96.766
66.344	127.924
72.220	140.400
93.135	155.303];
units.tWw1   = {'d', 'g'};  label.tWw1 = {'time since birth', 'wet weight'};  
temp.tWw1    = C2K(34.7);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = 'GodfOliv1978';
%
data.tWw2 = [ ... % time since birth (w), length (cm)
0.839	11.133
5.950	12.915
12.906	19.607
19.454	26.554
21.965	32.294
28.711	47.061
33.953	63.936
41.104	78.717
51.188	97.365
57.804	111.589
66.136	129.911
72.260	139.001
93.076	135.363];
units.tWw2   = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight'};  
temp.tWw2    = C2K(34.7);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';
bibkey.tWw2 = 'GodfOliv1978';
%
data.tWw3 = [ ... % time since birth (w), length (cm)
1.111	10.873
5.686	12.368
19.987	27.380
29.156	42.765
34.305	55.056
41.493	65.797
50.883	86.577
58.326	98.943
66.271	115.366
72.674	123.387
93.184	138.330];
units.tWw3   = {'d', 'g'};  label.tWw3 = {'time since birth', 'wet weight'};  
temp.tWw3    = C2K(34.7);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature';
bibkey.tWw3 = 'GodfOliv1978';

%% set weights for all real data
weights = setweights(data, []);

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

%% Group plots
set1 = {'tWw1','tWw2','tWw3'}; subtitle1 = {'Data for different siblings'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '38K9H'; % Cat of Life
metaData.links.id_ITIS = '633512'; % ITIS
metaData.links.id_EoL = '1178673'; % Ency of Life
metaData.links.id_Wiki = 'Echinops_telfairi'; % Wikipedia
metaData.links.id_ADW = 'Echinops_telfairi'; % ADW
metaData.links.id_Taxo = '60677'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11100042'; % MSW3
metaData.links.id_AnAge = 'Echinops_telfairi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echinops_telfairi}}';
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
bibkey = 'GodfOliv1978'; type = 'Article'; bib = [ ... 
'author = {Gillian K. Godfrey and William Oliver}, ' ... 
'year = {1978}, ' ...
'title = {The reproduction and development of the Pigmy Hedgehog Tenrec \emph{Echinops telfairi}}, ' ...
'journal = {Dodo, Journal of the Jersey Wildlife Preservation Trust (now Durrell Wildlife Conservation Trust)}, ' ...
'volume = {15}, ' ...
'pages = {38-51}, ' ...
'howpublished = {\url{https://tenrec.lima-city.de/godfrey.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Echinops_telfairi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

