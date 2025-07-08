function [data, auxData, metaData, txtData, weights] = mydata_Nimbaphrynoides_occidentalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Nimbaphrynoides_occidentalis'; 
metaData.species_en = 'Mount Nimba toad'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm', 'jiTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 9*30.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'guess';
  temp.tpm = C2K(18);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'CastPint2000';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.75;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'amphibiaweb';
data.Li  = 2.7;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'CastPint2000';
  comment.Li = 'amphibiaweb: 2.05 cm';
data.Lim = 1.9;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';  bibkey.Lim  = 'CastPint2000';  
  comment.Lim = 'amphibiaweb: 1.8 cm';

data.Wwb = 0.026; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'SandMull2017','sciencedirect'};
  comment.Wwb = 'based on ova of 0.5-0.6 mm in diameter and 300 time increase in weight till birth: 300*pi/6*0.055^3';
data.Wwj = 0.045;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'amphibiaweb';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwi = 1.94; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bombina bombina (2.7/5.2)^3*13.9';
data.Wwim = 0.68; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Bombina bombina (1.9/5.2)^3*13.9';

data.Ri = 37/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'amphibiaweb';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '4-35 young per litter';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
0	0.631
0	0.682
0	0.699
0	1.059
0	1.093
0	1.155
0	1.206
0	1.307
1	1.899
1	1.837
1	2.214
1	1.680
1	1.922
1	1.989
1	2.068
2	2.311
2	2.204
2	2.232
2	2.272
2	1.945
3	2.419
3	2.262
3	2.374
3	2.605
3	2.492
5	2.680
5	2.630];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.5) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CastPint2000'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
1	1.758
1	1.815
1	1.905
1	1.955
1	1.117
1	1.207
1	1.257
1	1.314
1	1.415
1	2.017
1	1.449
1	1.471
1	1.516
1	1.629
1	1.663
1	1.370
1	1.556
1	1.719
1	1.060
2	1.365
2	1.517
2	1.923
2	1.968
2	2.024
2	1.202
2	1.754
2	1.810
2	1.872
2	2.114];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.5) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CastPint2000'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Combines internal fertilization with viparity; fetuses are nourished by secretions of the oviductal epithelium';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'N. osgoodi is oviparous with free-living larvae; N. malcolmi has direct development; and N. viviparous and N. torineri are ovoviviparous (lecithotrophic live-bearing toads).';
metaData.bibkey.F1 = 'sciencedirect'; 
F3 = 'Found at 1200-1600 m alt on Mt. Nimba';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '47FB6'; % Cat of Life
metaData.links.id_ITIS = '585634'; % ITIS
metaData.links.id_EoL = '1037932'; % Ency of Life
metaData.links.id_Wiki = 'Nimbaphrynoides_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Nimbaphrynoides_occidentalis'; % ADW
metaData.links.id_Taxo = '47815'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Nimbaphrynoides+occidentalis'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nimbaphrynoides_occidentalis}}';
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
bibkey = 'CastPint2000'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s0003-4339(00)00103-9}, ' ...
'author = {Jacques Castanet and Sylvie Pinto and Marie-Madeleine Loth and Maxime Lamotte}, ' ... 
'year = {2000}, ' ...
'title = {Age individuel, long\''{e}vit\''{e} et dynamique de croissance osseuse chez un amphibien vivipare, \emph{Nectophrynoides occidentalis} ({A}noure, {B}ufonid\''{e})}, ' ...
'journal = {Annales des Sciences Naturelles}, ' ...
'volume = {21(1)}, ' ...
'pages = {11–17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SandMull2017'; type = 'Article'; bib = [ ... 
'doi = {10.3897/zse.93.10489}, ' ...
'author = {Laura Sandberger-Loua and Hendrik M\"{u}ller and Mark-Oliver R\"{o}del}, ' ... 
'year = {2017}, ' ...
'title = {A review of the reproductive biology of the only known matrotrophic viviparous anuran, the {W}est {A}frican {N}imba toad, \emph{Nimbaphrynoides occidentalis}}, ' ...
'journal = {Zoosyst. Evol.}, ' ...
'volume = {93(1)}, ' ...
'pages = {105–133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Nimbaphrynoides+occidentalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sciencedirect'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sciencedirect.com/topics/agricultural-and-biological-sciences/nimbaphrynoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
