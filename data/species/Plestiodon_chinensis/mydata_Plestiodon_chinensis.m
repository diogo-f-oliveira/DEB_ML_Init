function [data, auxData, metaData, txtData, weights] = mydata_Plestiodon_chinensis

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Plestiodon_chinensis';
metaData.species_en = 'Chinese skink';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wdb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wde'; 't-WdYe'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 06 18];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2019 06 18];

%% set data
% zero-variate data;
data.ab = 45.2;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'MaGuo2019';
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '35.1 to 48.4 d';
data.tp = 365;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on value for Plestiodon egregius';
data.am = 8*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on values for other scincidae as given in AnAge';

data.Wdb = 0.12; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'MaGuo2019';
data.Wwi = 53.84; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 17/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'MaGuo2019';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 to 23 eggs per clutch, 1 clutch per yr';

% univariate data
% time-yolk dry weight
data.tYe = [ ... % age (d),  yolk dry weight (g)
0.000000	0.166076
4.842615	0.166125
9.878935	0.168463
14.818402	0.156678
19.854722	0.148711
24.891041	0.117843
29.830508	0.104913
34.963680	0.070229
40.096852	0.045469
45.230024	0.013075];
units.tYe  = {'d', 'g'};  label.tYe = {'age', 'yolk dry weight'};  
temp.tYe   = C2K(24);  units.temp.tYe = 'K'; label.temp.tYe = 'temperature';
bibkey.tYe = 'MaGuo2019';

% time-embryo dry weight
data.tWe = [ ... % age (d),  yolk dry weight (g)
0.000000	0.006152
4.745763	0.009254
9.782082	0.013118
14.721550	0.018891
19.951574	0.030391
24.891041	0.044942
29.927361	0.059494
34.963680	0.084733
40.000000	0.092414
45.036320	0.121470];
units.tWe  = {'d', 'g'};  label.tWe = {'age', 'embryo dry weight'};  
temp.tWe   = C2K(24);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'MaGuo2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = 5 * weights.tWe;
weights.tYe = 5 * weights.tYe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Eggs gain weight during development, from 0.73 to 2.1 g, due to water uptake';
metaData.bibkey.F1 = 'MaGuo2019'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W2DS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '794699'; % Ency of Life
metaData.links.id_Wiki = 'Plestiodon_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Plestiodon_chinensis'; % ADW
metaData.links.id_Taxo = '3816568'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Plestiodon&species=chinensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plestiodon}}';   
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
bibkey = 'MaGuo2019'; type = 'Article'; bib = [ ...
'doi = {10.16373/j.cnki.ahr.180094}, ' ...
'author = {Li Ma and Kun Guo and Shan Su and Xiang Ji}, ' ...
'title = {Embryonic Growth and Yolk Depletion during Incubation in the Chinese Skink, \emph{Plestiodon chinensis}}, ' ...
'journal = {Asian Herpetological Research}, ' ...
'volume = {10(1)}, ' ...
'pages = {56-61}, ' ...
'year = {2019}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794699}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


