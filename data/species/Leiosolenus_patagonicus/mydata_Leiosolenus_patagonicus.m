function [data, auxData, metaData, txtData, weights] = mydata_Leiosolenus_patagonicus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Leiosolenus_patagonicus'; 
metaData.species_en = 'Date mussel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'Wdi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 28]; 

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'BaguRich2013';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 3.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BaguRich2013';

data.Wwb = 9.7e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 123 mum: pi/6*0.0123^3';
data.Wdp = 0.0353;   units.Wdp = 'g';   label.Wdp = 'wet weight at puberty';   bibkey.Wdp = {'guess','BaguRich2013'};
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Lp)), see F1';
data.Wdi = 0.337;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'BaguRich2013';
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Li)), see F1';

data.GSI  = 0.12;   units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(19);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.000	0.885
0.000	0.335
0.022	0.708
0.067	0.773
0.922	1.388
0.945	1.099
1.979	2.422
2.024	2.366
2.069	1.724
2.924	2.348
2.946	2.395
2.991	2.479
3.036	2.535
3.059	2.889
3.936	3.671
3.958	2.610
3.981	2.927
3.981	2.768
4.003	2.824
4.093	1.800
4.971	2.704
5.016	2.965
5.016	3.821
5.016	3.868
5.038	3.784
5.106	2.155
5.938	3.133
5.960	3.961
5.960	3.906
5.983	4.008
6.005	3.468
6.005	3.356
6.005	1.867
6.950	3.301
6.950	3.450
6.972	2.752
6.972	3.320
6.972	3.376
6.995	2.836
6.995	2.985
6.995	3.729
7.040	3.599
7.062	1.811
7.939	3.814
7.984	3.590
7.984	3.488
7.984	3.162
7.984	2.901
8.029	3.684
8.052	3.442
8.052	3.237
8.074	3.749
8.952	2.781
8.974	3.461
8.997	3.517
8.997	3.703
10.009	3.452
10.976	3.267
10.976	3.323
10.998	3.397
10.998	3.462
12.055	3.193];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaguRich2013';
comment.tL = 'Data from at Santa Elena, Argentina 37:51 S, 57:30 W';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 
weights.GSI = 3 * weights.GSI; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: soft-tissue Wd in g = 10^(-5.02+2.9*(shell length in mm))';
metaData.bibkey.F1 = 'BaguRich2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3T2GP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466899'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3962974'; % Taxonomicon
metaData.links.id_WoRMS = '506057'; % WoRMS
metaData.links.id_molluscabase = '506057'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilidae}}';
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
bibkey = 'BaguRich2013'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-014-0400-9}, ' ...
'author = {Mar\''{i}a Bagur and Christopher A. Richardson and Jorge L. Guti\''{e}rrez and Lorena P. Arribas and M. Socorro Doldan and M. Gabriela Palomo}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and mortality in four populations of the boring bivalve \emp{Lithophaga patagonica} from {A}rgentina}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {81}, ' ...
'pages = {49-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

