function [data, auxData, metaData, txtData, weights] = mydata_Pholas_dactylus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Pholadidae';
metaData.species    = 'Pholas_dactylus'; 
metaData.species_en = 'Common piddock'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'Wdi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 28]; 

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'PinnRich2005';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 7.54;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PinnRich2005';

data.Wwb = 9.7e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 123 mum: pi/6*0.0123^3';
data.Wdp = 0.337;   units.Wdp = 'g';   label.Wdp = 'wet weight at puberty';   bibkey.Wdp = {'guess','BaguRich2013'};
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Lp)), see F1';
data.Wdi = 2.66;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = {'BaguRich2013','PinnRich2005'};
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Li)), see F1';

data.GSI  = 0.12;   units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
-0.065	1.921
-0.022	3.293
0.000	2.174
0.950	3.483
0.950	3.251
0.950	2.976
0.950	2.153
0.950	1.266
0.950	1.077
0.972	4.369
0.972	1.456
1.943	2.744
1.943	2.871
1.943	3.546
1.943	3.757
1.943	4.137
1.965	1.161
1.965	1.858
1.965	2.132
1.965	2.364
1.965	5.024
2.958	3.272
2.980	4.813
3.001	5.214
3.001	4.137
3.001	3.842
3.023	3.736
3.023	3.124
3.023	2.744
3.951	4.053
3.951	4.939
3.951	5.214
3.973	6.755
3.995	2.765
3.995	3.778
3.995	5.868
4.016	3.230
4.016	4.707
4.988	5.256
4.988	5.066
5.009	5.720
5.009	3.272
5.938	7.430
5.960	7.557
5.981	4.623
6.974	5.720
6.974	4.602
7.968	5.720
7.989	4.982
8.011	6.142
9.026	7.240
9.026	5.530
9.976	6.649
10.991	5.995
11.012	6.628
11.962	7.092
14.013	6.480];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PinnRich2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 
weights.GSI = 3 * weights.GSI; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
%weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight for Leiosolenus_patagonicus: soft-tissue Wd in g = 10^(-5.02+2.9*(shell length in mm))';
metaData.bibkey.F1 = 'BaguRich2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GKW9'; % Cat of Life
metaData.links.id_ITIS = '81812'; % ITIS
metaData.links.id_EoL = '46470683'; % Ency of Life
metaData.links.id_Wiki = 'Pholas_dactylus'; % Wikipedia
metaData.links.id_ADW = 'Pholas_dactylus'; % ADW
metaData.links.id_Taxo = '39946'; % Taxonomicon
metaData.links.id_WoRMS = '140770'; % WoRMS
metaData.links.id_molluscabase = '140770'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholas_dactylus}}';
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
bibkey = 'PinnRich2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-005-1582-0}, ' ...
'author = {Eunice H. Pinn and C. A. Richardson and R. C. Thompson S. J. Hawkins}, ' ... 
'year = {2005}, ' ...
'title = {Burrow morphology, biometry, age and growth of piddocks ({M}ollusca: {B}ivalvia: {P}holadidae) on the south coast of {E}ngland}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {147}, ' ...
'pages = {943-953}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaguRich2013'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-014-0400-9}, ' ...
'author = {Mar\''{i}a Bagur and Christopher A. Richardson and Jorge L. Guti\''{e}rrez and Lorena P. Arribas and M. Socorro Doldan and M. Gabriela Palomo}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and mortality in four populations of the boring bivalve \emph{Lithophaga patagonica} from {A}rgentina}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {81}, ' ...
'pages = {49-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

