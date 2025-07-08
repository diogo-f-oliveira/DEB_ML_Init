function [data, auxData, metaData, txtData, weights] = mydata_Pleurodeles_waltl

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Pleurodeles_waltl'; 
metaData.species_en = 'Iberian ribbed newt'; 

metaData.ecoCode.climate = {'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFc', 'jiTh'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww','t-JO'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 27];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data;
data.ab = 13;        units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'AnAge';    
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 138;       units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'VladAlek2017';
  temp.tj = C2K(18); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 396;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'VladAlek2017';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.5*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 0.1796;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'huisdieren';
  comment.Wwb = 'based on egg diameter of 7 mm: pi/6*0.7^3'; 
data.Wwj = 4.4;      units.Wwj = 'g';   label.Wwj = 'wet weight at metam';        bibkey.Wwj = 'VladAlek2017';
data.Wwp = 18;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'VladAlek2017';
data.Wwi = 62;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'VladAlek2017';
data.Wwim = 33;      units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'VladAlek2017';

data.Ri  = 200/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'huisdieren';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
0.379	4.409
0.421	5.039
0.489	6.457
0.582	8.661
0.687	10.551
0.835	14.646
0.982	17.795
1.084	20.315
1.561	46.457
2.130	58.110
2.438	57.480
2.909	57.480
3.516	61.102];
data.tW_f(:,1) = 365 * data.tW_f(:,1);
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(18);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'VladAlek2017';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
1.083	18.110
1.488	26.614
1.594	30.394
2.145	33.386
2.495	32.756
2.908	33.543
3.501	32.441];
data.tW_m(:,1) = 365 * data.tW_m(:,1);
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(18);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'VladAlek2017';
comment.tW_m = 'data for males';

% time-respiration
data.tJO_f = [ ... % time since birth (yr), O2 consumption (mL/h)
0.388	0.333
0.450	0.415
0.498	0.362
0.593	0.531
0.708	0.543
0.900	0.706
0.995	0.724
1.493	1.243
1.990	1.868
2.507	1.874
2.995	1.803
3.502	1.936];
data.tJO_f(:,1) = 365 * data.tJO_f(:,1);
units.tJO_f  = {'d', 'mL/h'};  label.tJO_f = {'time since birth', 'O2 consumption', 'female'};  
temp.tJO_f   = C2K(18);  units.temp.tJO_f = 'K'; label.temp.tJO_f = 'temperature';
bibkey.tJO_f = 'VladAlek2017';
comment.tJO_f = 'data for females';
%
data.tJO_m = [ ... % time since birth (yr), O2 consumption (mL/h)
0.995	0.858
1.493	0.951
2.005	1.114
2.502	1.037
3.000	1.060
3.502	1.077];
data.tJO_m(:,1) = 365 * data.tJO_m(:,1);
units.tJO_m  = {'d', 'mL/h'};  label.tJO_m = {'time since birth', 'O2 consumption', 'male'};  
temp.tJO_m   = C2K(18);  units.temp.tJO_m = 'K'; label.temp.tJO_m = 'temperature';
bibkey.tJO_m = 'VladAlek2017';
comment.tJO_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.tJO_f = 0 * weights.tJO_f;
weights.tJO_m = 0 * weights.tJO_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tJO_f','tJO_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Predicted O2 consumption rates turn out to be 5 times the measured values. The reason is not undestood, the data is ignored in the fit';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% facts
F1 = 'Sex determination is regulated by sex chromosomes, but can be overridden by temperature';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KBDC'; % Cat of Life
metaData.links.id_ITIS = '668389'; % ITIS
metaData.links.id_EoL = '330419'; % Ency of Life
metaData.links.id_Wiki = 'Pleurodeles_waltl'; % Wikipedia
metaData.links.id_ADW = 'Pleurodeles_waltl'; % ADW
metaData.links.id_Taxo = '47306'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pleurodeles+waltl'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pleurodeles_waltl'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurodeles_waltl}}';   
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
bibkey = 'VladAlek2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S106235901704015X}, ' ...
'author = {I. G. Vladimirova and T. A. Alekseeva and S. Yu. Kleymenov}, ' ... 
'year = {2017}, ' ...
'title = {The Dynamics of Mass Growth and Oxygen Consumption in Ontogenesis of the Newt \emph{Pleurodeles waltl}: 3. {T}he Postlarval Period}, ' ...
'journal = {Biology Bulletin}, ' ...
'volume = {44(4)}, ' ...
'pages = {372-378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pleurodeles_waltl}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'huisdieren'; type = 'Misc'; bib = ... 
'howpublished = {\url{www.huisdieren.nu/wp-content/uploads/2013/03/Pleurodeles-waltl.pdf}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

