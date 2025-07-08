function [data, auxData, metaData, txtData, weights] = mydata_Phymaturus_patagonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Liolaemidae';
metaData.species    = 'Phymaturus_patagonicus'; 
metaData.species_en = 'Patagonia mountain lizard'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 15];

%% set data
% zero-variate data

data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PianIbar2006';   
  temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 4*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'PianIbar2006';   
  temp.tpm = C2K(30); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'PianIbar2006';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'PianIbar2006';  
data.Lp  = 8.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'PianIbar2006';  
data.Lpm  = 8.7;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'PianIbar2006';
data.Li  = 11;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'PianIbar2006';  

data.Wwi = 46.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Basiliscus_basiliscus: 416.5*(11/22.8)^3';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'PianIbar2006';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per clutch, 1 clutch each 2 yr';

% univariate data
% time -  length data
data.tL = [ ... % age (yr),  SVL (cm)
0.977	3.354
0.994	5.123
1.011	6.769
1.013	5.565
2.960	6.921
3.989	5.326
4.027	7.095
4.986	9.554
4.987	9.358
6.978	9.215
7.020	8.871
7.942	9.512
7.961	9.905
7.966	7.718
8.004	9.045
8.005	8.799
8.945	10.546
8.948	9.121
9.008	9.858
9.028	10.005
9.991	10.868
10.034	10.081
6.894	9.393
8.907	9.652
8.981	9.293
9.019	8.826
9.950	8.866
10.994	9.697
10.994	9.194
11.888	9.736
12.857	9.884
13.938	10.571
13.975	10.068
15.913	10.866];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PianIbar2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous; males and females similar in size and growth, herbivorous';
metaData.bibkey.F1 = 'PianIbar2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VH2P'; % Cat of Life
metaData.links.id_ITIS = '1056563'; % ITIS
metaData.links.id_EoL = '47044867'; % Ency of Life
metaData.links.id_Wiki = 'Phymaturus'; % Wikipedia
metaData.links.id_ADW = 'Phymaturus_patagonicus'; % ADW
metaData.links.id_Taxo = '643955'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Phymaturus&species=patagonicus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phymaturus}}';
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
bibkey = 'PianIbar2006'; type = 'Article'; bib = [ ... 
'author = {Carla Piantoni and Nora R. Ibarg\"{u}engoyt\''{i}a and Victor E. Cussac}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of the {P}atagonian lizard \emph{Phymaturus patagonicus}}, ' ...
'pages = {385-392}, ' ...
'volume = {27}, ' ...
'journal = {Amphibia-Reptilia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
