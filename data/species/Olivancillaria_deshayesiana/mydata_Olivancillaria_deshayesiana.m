function [data, auxData, metaData, txtData, weights] = mydata_Olivancillaria_deshayesiana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Olividae';
metaData.species    = 'Olivancillaria_deshayesiana'; 
metaData.species_en = 'Argentina olive snail';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 01]; 

%% set data
% zero-variate data

data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ArriTeso2012';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.9;    units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 3.6;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'ArriTeso2012';

data.Wwb = 7e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 240 mum: 4/3 * pi * (0.012)^3';
data.Wwi = 7;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'ArriTeso2012';
  comment.Wwi = 'Based on 10^(-4.76+3.60*log10(10*Li)), see F1';

data.Ri  = 40*12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Urosalpinx_cinerea';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), shell length (cm)
0.750	1.819
0.751	1.531
0.764	1.926
0.766	1.588
0.766	1.465
0.780	1.737
0.780	1.663
1.715	2.436
1.732	2.173
1.747	2.082
1.747	2.008
1.762	2.239
1.763	1.951
1.776	2.346
1.778	1.885
2.759	2.617
2.775	2.305
2.789	2.527
2.790	2.412
2.790	2.214
3.756	2.798
3.757	2.716
3.757	2.617
3.788	2.527
3.788	2.436
3.788	2.354
4.801	2.510
4.802	2.477
4.815	2.955
4.816	2.593
4.846	2.782
4.846	2.716
4.847	2.412
5.783	2.856
5.813	2.996
5.814	2.897
5.814	2.675
5.845	2.609
5.845	2.568
6.811	3.193
6.827	2.840
6.828	2.765
6.872	3.111
6.872	2.979
6.887	3.053
7.841	2.938
7.841	2.872
7.841	2.807
7.855	3.243
7.855	3.177
7.885	3.078
8.869	3.160
8.869	3.021
8.883	3.276
8.900	2.963
9.867	3.292];
data.tL(:,1) = 365 * (0.9+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArriTeso2012';
comment.tL = 'Temperature ranges from 8.4 to 20.8 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight log10(SFWM in g) = -4.76+ 3.60 * log10(SL in mm)';
metaData.bibkey.F1 = 'ArriTeso2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74KGT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4838341'; % Ency of Life
metaData.links.id_Wiki = 'Olivancillaria_deshayesiana'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3972925'; % Taxonomicon
metaData.links.id_WoRMS = '225053'; % WoRMS
metaData.links.id_molluscabase = '225053'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Olivancillaria_deshayesiana}}';
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
bibkey = 'ArriTeso2012'; type = 'Article'; bib = [ ... 
'doi = {10.4002/040.055.0111}, ' ...
'author = {Florencia Arrighetti and Valeria Teso and Thomas Brey Andreas Mackensen and Pablo E. Penchaszadeh}, ' ... 
'year = {2012}, ' ...
'title = {Age and Growth of \emph{Olivancillaria deshayesiana} ({G}astropoda: {O}lividae) in the {S}outhwestern {A}tlantic {O}cean}, ' ...
'journal = {Malacologia}, ' ...
'volume = {55(1)}, ' ...
'pages = {163-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

