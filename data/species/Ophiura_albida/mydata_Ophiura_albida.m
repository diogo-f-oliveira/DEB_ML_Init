function [data, auxData, metaData, txtData, weights] = mydata_Ophiura_albida

%% set metaData
metaData.phylum     = 'Echinodermata';
metaData.class      = 'Ophiuroidea'; 
metaData.order      = 'Ophiurida'; 
metaData.family     = 'Ophiuridae';
metaData.species    = 'Ophiura_albida'; 
metaData.species_en = 'Serpent''s table brittle star'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'bjB', 'biD', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'Wdi'; 'Ri'}; 
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

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Amphiura_filiformis';
data.tj = 17;    units.tj = 'd';    label.tj = 'time since birth at metam';        bibkey.tj = 'guess';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'guess based on Amphiura_filiformis';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'marlin';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'values taken from Ophiura_ophiura';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess base on tL data and Li';

data.Lj  = 0.02;   units.Lj  = 'cm';  label.Lj  = 'disc diameter at metamorphosis';  bibkey.Lj  = 'guess';
data.Lp  = 0.3;   units.Lp  = 'cm';  label.Lp  = 'disc diameter at puberty';         bibkey.Lp  = {'marlin','Dahm1993'}; 
  comment.Lp = 'based on tp from tL data';
data.Li  = 1.5;   units.Li  = 'cm';  label.Li  = 'ultimate disc diameter';           bibkey.Li  = 'Wiki';
  comment.Li = 'arms up to 6 cm';

data.Wwb = 5.236e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight atb birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 0.1 mm: 4/3*pi*(0.01/2)^3';
data.Wdp = 7e-4;   units.Wdp = 'g';   label.Wdp = 'ashfree dry weight at puberty';  bibkey.Wdp = {'marlin','Dahm1993'};
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 0.0869;   units.Wdi = 'g';   label.Wdi = 'ultimate ash-free dry weight';   bibkey.Wdi = 'Wiki';
  comment.Wdi = 'based on 0.059 * (10*Li)^2.694, see F1';

data.Ri  = 250;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = {'guess','Dahm1993'};   
temp.Ri = C2K(10);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
 
% univariate data

% time-length
data.tL = [ ... % time since metam (yr), disc diameter (cm)
2.480	0.372
2.982	0.402
3.610	0.558
3.658	0.474
3.743	0.528
3.764	0.542
3.900	0.472
3.986	0.495
4.174	0.657
4.201	0.575
4.247	0.534
4.441	0.589
4.445	0.526
4.528	0.610
4.770	0.604
4.770	0.587
4.815	0.575
4.874	0.698
4.875	0.676
4.922	0.616
4.946	0.592
5.029	0.665
5.031	0.643
5.092	0.713
5.120	0.614
5.228	0.643
5.290	0.717
5.292	0.680
5.337	0.659
5.375	0.756
5.382	0.629
5.444	0.694
5.548	0.797
5.575	0.709
5.576	0.688
5.621	0.666
5.664	0.682
5.704	0.760
5.797	0.666
5.861	0.703
6.014	0.696
6.079	0.715
6.121	0.760
6.211	0.707
6.320	0.729
6.364	0.715
6.407	0.735
6.427	0.766
6.489	0.838
6.496	0.707
6.583	0.731
6.755	0.781
6.868	0.727
6.886	0.797
7.064	0.754
7.087	0.742
7.150	0.781
7.501	0.781
7.589	0.773
7.741	0.803
7.781	0.879
7.895	0.803
7.917	0.793
8.046	0.838
8.179	0.820
8.332	0.816
8.463	0.843
8.485	0.834
8.550	0.845
8.900	0.859
9.295	0.865
9.513	0.878
9.951	0.902
10.301	0.913];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'disc diameter'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dahm1993';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'mass (mg AFDM) = 0.059 (disc diam in mm)^2.694';
metaData.bibkey.F1 = 'Dahm1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74Q6H'; % Cat of Life
metaData.links.id_ITIS = '157426'; % ITIS
metaData.links.id_EoL = '598371'; % Ency of Life
metaData.links.id_Wiki = 'Ophiura_albida'; % Wikipedia
metaData.links.id_ADW = 'Ophiura_albida'; % ADW
metaData.links.id_Taxo = '41020'; % Taxonomicon
metaData.links.id_WoRMS = '124913'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ophiura_albida}}';
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
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6016}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];