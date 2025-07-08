function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_nigromaculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_nigromaculatus'; 
metaData.species_en = 'Dark-spotted frog'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

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
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'LiaoZhou2010';
  temp.tp = C2K(17.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;units.tpm = 'd';   label.tpm = 'time since metam at puberty for males';  bibkey.tpm = 'LiaoZhou2010';
  temp.tpm = C2K(17.1); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(17.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';            bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 5.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';          bibkey.Lp  = 'Gunt1990';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 10.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'LiaoZhou2010';
data.Lim = 9;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';     bibkey.Lim  = 'LiaoZhou2010';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.2^3';
data.Wwj = 0.7;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 20;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 118; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (10.5/9.5)^3*87.5';

data.Ri = 5e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'LiaoZhou2010';   
  temp.Ri = C2K(17.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f3 = [ ... % time since metam (d), SVL (cm)
1.981	8.783
1.981	8.001
1.981	7.816
1.995	8.392
2.975	9.733
2.982	8.273
2.982	8.150
2.982	8.006
2.982	7.862
2.982	7.759
2.989	7.615
3.003	8.643
3.977	10.046
3.977	9.737
3.977	8.462
3.984	8.627
3.984	8.298
4.004	8.915
4.985	10.441];
data.tL_f3(:,1) = (data.tL_f3(:,1) + 0.75) * 365; % convert yr to d
units.tL_f3   = {'d', 'cm'};  label.tL_f3 = {'time since metam', 'SVL', 'female'};  
temp.tL_f3    = C2K(17.1);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'LiaoZhou2010';
comment.tL_f3 = 'Data for females at 300 m';
%
data.tL_m3 = [ ... % time since metam (d), SVL (cm)
1.988	7.652
1.988	7.282
1.988	7.097
1.988	6.932
1.988	6.747
1.995	6.521
2.975	7.882
2.982	6.751
2.982	7.121
2.989	7.286
2.989	7.533
4.004	8.051];
data.tL_m3(:,1) = (data.tL_m3(:,1) + 0.75) * 365; % convert yr to d
units.tL_m3   = {'d', 'cm'};  label.tL_m3 = {'time since metam', 'SVL', 'male'};  
temp.tL_m3    = C2K(17.1);  units.temp.tL_m3 = 'K'; label.temp.tL_m3 = 'temperature';
bibkey.tL_m3 = 'LiaoZhou2010';
comment.tL_m3 = 'Data for males at 300 m';
%
data.tL_f8 = [ ... % time since metam (d), SVL (cm)
1.985	7.541
1.999	7.622
2.005	8.020
2.006	7.405
2.006	7.324
2.006	7.252
2.973	7.516
2.973	7.434
2.973	7.380
2.979	7.940
2.986	7.778
2.986	7.714
2.986	7.624
3.988	7.743
4.001	7.780
4.002	7.563];
data.tL_f8(:,1) = (data.tL_f8(:,1) + 0.75) * 365; % convert yr to d
units.tL_f8   = {'d', 'cm'};  label.tL_f8 = {'time since metam', 'SVL', 'female'};  
temp.tL_f8    = C2K(15.2);  units.temp.tL_f8 = 'K'; label.temp.tL_f8 = 'temperature';
bibkey.tL_f8 = 'LiaoZhou2010';
comment.tL_f8 = 'Data for females at 800 m';
%
data.tL_m8 = [ ... % time since metam (d), SVL (cm)
1.987	6.583
1.994	6.664
1.994	6.502
2.000	7.143
2.002	6.258
2.007	6.927
2.007	6.845
2.008	6.755
2.014	6.981
2.016	6.149
2.022	6.393
2.022	6.321
2.982	6.440
2.988	6.856
2.996	6.630
4.009	7.246];
data.tL_m8(:,1) = (data.tL_m8(:,1) + 0.75) * 365; % convert yr to d
units.tL_m8   = {'d', 'cm'};  label.tL_m8 = {'time since metam', 'SVL', 'male'};  
temp.tL_m8    = C2K(15.2);  units.temp.tL_m8 = 'K'; label.temp.tL_m8 = 'temperature';
bibkey.tL_m8 = 'LiaoZhou2010';
comment.tL_m8 = 'Data for males at 800 m';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f3 = 3 * weights.tL_f3;
weights.tL_m3 = 3 * weights.tL_m3;
weights.tL_f8 = 3 * weights.tL_f8;
weights.tL_m8 = 3 * weights.tL_m8;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f3','tL_m3'}; subtitle1 = {'Data for females, males at 300 m'};
set2 = {'tL_f8','tL_m8'}; subtitle2 = {'Data for females, males at 800 m'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'Reference to Gunt1990 concerns Pelophylax_esculentus';
metaData.discussion = struct('D1', D1,'D2', D2, 'D3', D3);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76CHL'; % Cat of Life
metaData.links.id_ITIS = '775191'; % ITIS
metaData.links.id_EoL = '331357'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_nigromaculatus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_nigromaculatus'; % ADW
metaData.links.id_Taxo = '996609'; % Taxonomicon
metaData.links.id_WoRMS = '1488231'; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+nigromaculatus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pelophylax_nigromaculatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_nigromaculatus}}';
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
bibkey = 'LiaoZhou2010'; type = 'Article'; bib = [ ... 
'author = {Wen Bo Liao and Cai Quan Zhou and Zhi Song Yang and Jin Chu Hu and Xin Lu}, ' ... 
'year = {2010}, ' ...
'title = {Age, size and growth in two populations of the darkspotted frog \emph{Rana nigromaculata} at different altitudes in southwestern {C}hina}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {20}, ' ...
'pages = {77-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunt1990'; type = 'Book'; bib = [ ...  
'author = {G\"{u}nther, R.}, ' ...
'year = {1990}, ' ...
'title  = {Die Wasserfr\"{o}sche Europas}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelophylax_nigromaculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

