function [data, auxData, metaData, txtData, weights] = mydata_Ophiura_ophiura

%% set metaData
metaData.phylum     = 'Echinodermata';
metaData.class      = 'Ophiuroidea'; 
metaData.order      = 'Ophiurida'; 
metaData.family     = 'Ophiuridae';
metaData.species    = 'Ophiura_ophiura'; 
metaData.species_en = 'Serpent star'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biB', 'biD', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wdp', 'Wdi', 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author  = {'Bas Kooijman'};                  
metaData.date_subm    = [2017 09 23];                      
metaData.email   = {'bas.kooijman@vu.nl'};      
metaData.address = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 23]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Amphiura_filiformis';
data.tj = 17;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'guess';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'guess based on Amphiura_filiformis';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'marlin';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess base on tL data and Li';

data.Lj  = 0.0325;   units.Lj  = 'cm';  label.Lj  = 'disc diameter at metamorphosis';  bibkey.Lj  = 'guess';
data.Lp  = 0.4;   units.Lp  = 'cm';  label.Lp  = 'disc diameter at puberty';          bibkey.Lp  = {'marlin','Dahm1993'};
  comment.Lp = 'based on tp from tL data';
data.Li  = 3.5;   units.Li  = 'cm';  label.Li  = 'ultimate disc diameter';            bibkey.Li  = 'Wiki';
  comment.Li = 'arms up to 14 cm';

data.Wwb = 5.236e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight atb birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 0.1 mm: 4/3*pi*(0.01/2)^3';
data.Wdp = 1.6e-3;   units.Wdp = 'g';   label.Wdp = 'ashfree dry weight at puberty';  bibkey.Wdp = {'marlin','Dahm1993'};
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 1.0681;   units.Wdi = 'g';   label.Wdi = 'ultimate ash-free dry weight';   bibkey.Wdi = {'guess','Dahm1993'};
  comment.Wdi = 'based on 0.044 * (10*Li)^2.840, see F1';

data.Ri  = 880;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(10);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% univariate data

% time-length
data.tL = [ ... % time since metam (yr), disc diameter (cm)
2.938	0.531
2.965	0.413
3.274	0.523
3.511	0.621
3.697	0.862
4.038	0.685
4.132	0.761
4.181	0.714
4.611	0.778
4.658	0.821
5.043	0.766
5.089	0.851
5.374	0.961
5.521	0.876
5.687	0.923
5.780	1.033
5.831	0.944
5.951	0.936
5.974	0.978
6.044	1.055
6.209	1.161
6.448	1.212
6.452	1.059
6.693	1.025
6.715	1.068
7.289	1.149
7.290	1.115
7.574	1.272
7.578	1.115
7.673	1.145
7.767	1.238
7.814	1.268
8.054	1.276
8.057	1.141
8.151	1.242
8.245	1.315
8.248	1.179
8.249	1.145
8.270	1.264
8.413	1.298
8.414	1.272
8.747	1.400
8.821	1.323
9.107	1.383
9.107	1.366
9.228	1.336
9.299	1.379
9.300	1.332
9.348	1.362
9.369	1.459
9.467	1.387
9.587	1.387
9.875	1.392
10.211	1.392
10.377	1.468
10.592	1.503
11.143	1.524];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'disc diameter'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dahm1993';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'mass (mg AFDM) = 0.044 * (disc diam in mm)^2.840';
metaData.bibkey.F1 = 'Dahm1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74PFS'; % Cat of Life
metaData.links.id_ITIS = '206823'; % ITIS
metaData.links.id_EoL = '585896'; % Ency of Life
metaData.links.id_Wiki = 'Ophiura_ophiura'; % Wikipedia
metaData.links.id_ADW = 'Ophiura_ophiura'; % ADW
metaData.links.id_Taxo = '498605'; % Taxonomicon
metaData.links.id_WoRMS = '124929'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ophiura_ophiura}}';
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
bibkey = 'Dahm1993'; type = 'Article'; bib = [ ... 
'author = {C. Dahm}, ' ... 
'year = {1993}, ' ...
'title = {Growth, production and ecological significance of \emph{Ophiura aibida} and \emph{O. ophiura} ({E}chinodermata: {O}phiuroidea) in the {G}erman {B}ight}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {116}, ' ...
'pages = {431--437}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6187}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
