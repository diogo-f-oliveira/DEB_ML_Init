function [data, auxData, metaData, txtData, weights] = mydata_Perodicticus_potto
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lorisidae';
metaData.species    = 'Perodicticus_potto'; 
metaData.species_en = 'Potto'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 05]; 


%% set data
% zero-variate data

data.tg = 170;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BuckFred2006';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 547;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 32.4*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 28.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BuckFred2006';
data.Wwx = 76;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'BuckFred2006';
data.Wwi = 1100; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '600 till 1600 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.tW = [ ... % time since birth (d), weight (g)
0.527	28.313
5.571	38.124
6.474	36.908
7.528	38.748
8.695	41.607
9.636	46.094
10.615	44.472
11.593	48.959
12.798	51.207
13.701	54.065
14.755	52.850
16.750	56.326
19.762	68.566
20.816	67.759
21.832	69.395
22.923	74.087
24.956	76.952
25.897	75.940
26.876	87.759
27.892	86.340
29.849	90.631];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(36.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BuckFred2006';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4F78J'; % Cat of Life
metaData.links.id_ITIS = '572892'; % ITIS
metaData.links.id_EoL = '47049510'; % Ency of Life
metaData.links.id_Wiki = 'Perodicticus_potto'; % Wikipedia
metaData.links.id_ADW = 'Perodicticus_potto'; % ADW
metaData.links.id_Taxo = '65548'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100120'; % MSW3
metaData.links.id_AnAge = 'Perodicticus_potto'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perodicticus_potto}}';
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
bibkey = 'BuckFred2006'; type = 'Article'; bib = [ ... 
'author = {H. D. Buckanoff and C. Frederick and H. Weston Murphy}, ' ... 
'year = {2006}, ' ...
'title = {Hand-rearing a Potto \emph{Perodicticus potto} at {Franklin Park Zoo, Boston}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {40}, ' ...
'pages = {302--312}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Perodicticus_potto}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

