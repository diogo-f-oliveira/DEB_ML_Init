function [data, auxData, metaData, txtData, weights] = mydata_Barnea_parva

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Pholadidae';
metaData.species    = 'Barnea_parva'; 
metaData.species_en = 'Little piddock'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'Wdi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

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

data.am = 6*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'PinnRich2005';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 4.6;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PinnRich2005';

data.Wwb = 9.7e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 123 mum: pi/6*0.0123^3';
data.Wdp = 0.0353;   units.Wdp = 'g';   label.Wdp = 'wet weight at puberty';   bibkey.Wdp = {'guess','BaguRich2013'};
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Lp)), see F1';
data.Wdi = 0.634;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = {'BaguRich2013','PinnRich2005'};
  comment.Wdi = 'Based on 10^(-5.02 + 2.9*log10(10*Li)), see F1';

data.GSI  = 0.12;   units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.044	1.524
0.978	1.646
0.987	1.553
0.988	1.833
0.989	2.208
0.990	2.288
0.991	2.662
1.003	3.184
1.004	1.152
1.005	1.259
1.011	2.823
1.987	1.648
1.989	2.210
1.990	2.437
2.000	2.544
2.011	2.945
2.012	3.239
2.985	3.682
2.989	2.038
2.989	2.238
2.990	2.372
2.991	2.639
2.992	2.840
2.994	3.495
2.997	1.623
4.013	3.283
4.015	3.992
5.018	2.135
6.017	4.570];
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
F1 = 'length-weight for Leiosolenus_patagonicus: soft-tissue Wd in g = 10^(-5.02+2.9*(shell length in mm))';
metaData.bibkey.F1 = 'BaguRich2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68DSW'; % Cat of Life
metaData.links.id_ITIS = '81800'; % ITIS
metaData.links.id_EoL = '46470668'; % Ency of Life
metaData.links.id_Wiki = 'Barnea_(bivalve)'; % Wikipedia
metaData.links.id_ADW = 'Barnea_parva'; % ADW
metaData.links.id_Taxo = '275673'; % Taxonomicon
metaData.links.id_WoRMS = '140768'; % WoRMS
metaData.links.id_molluscabase = '140768'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Barnea}}';
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

