function [data, auxData, metaData, txtData, weights] = mydata_Pyxicephalus_adspersus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pyxicephalidae';
metaData.species    = 'Pyxicephalus_adspersus'; 
metaData.species_en = 'African bullfrog'; 

metaData.ecoCode.climate = {'BSh', 'BWh', 'Cwb', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTa', 'jiTd'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc  = [2017 10 25]; 


%% set data
% zero-variate data

data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 21;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'ADW';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 40;    units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'HayeLich1992';
  temp.tp = C2K(31.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 45*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';  
data.Lj  = 1.4;  units.Lj  = 'cm';  label.Lj  = 'body length at metam';   bibkey.Lj  = 'HayeLich1992'; 
data.Lp  = 5.3;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty'; bibkey.Lp  = 'HayeLich1992'; 
data.Li  = 19.2;   units.Li  = 'cm';  label.Li  = 'ultimate body length for females';   bibkey.Li  = 'HayeLich1992';
  comment.Li = 'based on tL-data and Lim: (8.7/11.1)*24.5';
data.Lim  = 24.5;  units.Lim  = 'cm'; label.Lim  = 'ultimate body length for males';   bibkey.Lim  = 'Wiki';

data.Wwb = 0.01; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwj = 6.5;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'HayeLich1992';
  comment.Wwj = 'weight as frog';
data.Wwp = 30;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'HayeLich1992';
data.Wwi = 838;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on tW-data and Wwi: (124/207)*1400';
data.Wwim = 1400;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 4000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '1 brood/year';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since memtam (d), body length (cm)
0.000	1.380
25.113	3.095
58.371	5.097
95.023	6.532
137.783	7.726
164.932	8.143
194.118	8.236
222.624	8.491
252.489	8.585
302.036	8.686];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'body length', 'female'};  
temp.tL_f    = C2K(31.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HayeLich1992';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), body length (cm)
0.000	1.420
25.792	3.054
57.692	5.178
94.344	7.141
137.783	8.944
164.932	9.645
194.118	10.752
222.624	10.723
252.489	10.817
301.357	11.121];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'body length', 'male'};  
temp.tL_m    = C2K(31.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HayeLich1992';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since metam (d), wet weight (g)
1.351	6.501
26.351	10.695
59.459	30.354
95.946	60.584
138.514	95.717
163.514	104.781
195.270	110.635
222.297	116.463
252.703	124.744
302.027	118.517];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since metam', 'wet weight', 'female'};  
temp.tW_f    = C2K(31.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HayeLich1992';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since metam (d), wet weight (g)
1.351	6.501
26.351	10.695
59.459	30.354
95.946	71.948
139.189	123.318
165.541	171.350
195.270	188.557
222.973	183.025
252.703	194.549
301.351	206.988];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since metam', 'wet weight', 'male'};  
temp.tW_m    = C2K(31.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'HayeLich1992';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.Lj = 10 * weights.Lj;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
weights.tj = 0 * weights.tj;
weights.Wwj = 0 * weights.Wwj;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Frogs are assumed to differ from tadpoles by del_M only';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Male takes care of tadpoles';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4QYCF'; % Cat of Life
metaData.links.id_ITIS = '665251'; % ITIS
metaData.links.id_EoL = '330829'; % Ency of Life
metaData.links.id_Wiki = 'Pyxicephalus_adspersus'; % Wikipedia
metaData.links.id_ADW = 'Pyxicephalus_adspersus'; % ADW
metaData.links.id_Taxo = '47618'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pyxicephalus+adspersus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pyxicephalus_adspersus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pyxicephalus_adspersus}}';
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
bibkey = 'HayeLich1992'; type = 'Article'; bib = [ ... 
'author = {T. Hayes and P. Licht}, ' ... 
'year = {1992}, ' ...
'title = {Gonadal Involvement in Sexual Size Dimorphism in the {A}frican Bullfrog (\emph{Pyxicephalus adspersus})}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {264}, ' ...
'pages = {130--135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/330829/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pyxicephalus_adspersus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pyxicephalus_adspersus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

