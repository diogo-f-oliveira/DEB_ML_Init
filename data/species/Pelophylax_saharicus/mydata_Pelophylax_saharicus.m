function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_saharicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_saharicus'; 
metaData.species_en = 'Sahara frog'; 

metaData.ecoCode.climate = {'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 29]; 

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Gunt1990';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'MeddNoui2007';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;units.tpm = 'd';   label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'MeddNoui2007';
  temp.tpm = C2K(22); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MeddNoui2007';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 5.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'Gunt1990';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 10.45;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';
data.Lim = 10;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';           bibkey.Lim  = 'MeddNoui2007';
  comment.Wwi = 'based on remark that males are slightly smaller than females';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.2^3';
data.Wwj = 0.7;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 20;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 118; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (10.5/9.5)^3*87.5';

data.Ri = 5e3/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'Gunt1990';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.993	4.558
0.993	6.029
1.931	5.131
1.972	5.723
1.986	5.418
2.000	6.162
2.055	5.418
2.097	5.112
2.979	4.043
2.979	5.532
2.979	5.895
2.979	6.029
2.979	6.296
2.993	6.831
3.021	7.002
3.090	5.532
3.090	5.895
3.090	5.800
3.131	6.831
4.993	7.804
5.103	7.804
7.034	9.084];
data.tL_f(:,1) = (data.tL_f(:,1) + .5) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MeddNoui2007';
comment.tL_f = 'Data for females at Menzel Bourguiba';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.952	5.131
0.966	2.496
0.979	5.895
1.903	5.723
1.986	3.890
1.986	5.112
1.986	5.303
2.000	3.222
2.014	4.635
2.083	5.723
2.952	6.181
2.993	4.959
2.993	4.730
2.993	4.329
3.007	6.716
3.131	6.334
3.131	6.716
3.986	6.162
4.000	5.685
5.021	7.155
5.034	7.480
5.131	7.155];
data.tL_m(:,1) = (data.tL_m(:,1) + .5) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MeddNoui2007';
comment.tL_m = 'Data for males at Menzel Bourguiba';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'Reference to Gunt1990 concerns Pelophylax_esculentus';
metaData.discussion = struct('D1', D1,'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '76CHS'; % Cat of Life
metaData.links.id_ITIS = '775196'; % ITIS
metaData.links.id_EoL = '1019680'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_saharicus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_saharicus'; % ADW
metaData.links.id_Taxo = '996614'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+saharicus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_saharicus}}';
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
bibkey = 'MeddNoui2007'; type = 'Article'; bib = [ ... 
'author = {Chokri Meddeb and Said Nouira and Tahar Lamine Cheniti and Patrick T. Walsh and J.R. Downie}, ' ... 
'year = {2007}, ' ...
'title = {Age structure and growth in two {T}unisian populations of green water frogs \emph{Rana saharica}: a skeletochronological approach}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {17}, ' ...
'pages = {54-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunt1990'; type = 'Book'; bib = [ ...  
'author = {G\"{u}nther, R.}, ' ...
'year = {1990}, ' ...
'title  = {Die Wasserfr\"{o}sche Europas}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

