function [data, auxData, metaData, txtData, weights] = mydata_Haliotis_mariae
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Vetigastropoda'; 
metaData.family     = 'Haliotidae';
metaData.species    = 'Haliotis_mariae'; 
metaData.species_en = 'Omani abalone'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 08]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.5; units.Lp  = 'cm';  label.Lp  = 'shell width at puberty for female'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Haliotis rubra: Li*9.7/20 cm';
data.Li  = 13.5; units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'SiddJohn1997';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 0.02 mm egg diameter: pi/6*0.02^3';   
data.Wwi = 398/3;  units.Wwi = 'g'; label.Wwi = 'shell-free wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on data Haliotis tuberculata, which gives a (total?) weight of 1.3 kg at shell length 20 cm; the assumption is that shell-free weight is 1/3 of this';   

data.Ri  = 2.3e6/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same specific max reprod rate, compared to Halitois rubra: 7.5e6*(13.5/20)^3';

% uni-variate data
% time-length data
data.tL_f = [ ... % initial length (cm), yearly length increment (cm/yr)
1.157	5.709
1.412	6.032
1.413	7.482
1.496	7.799
1.508	6.098
1.579	7.046
1.668	7.363
1.732	6.798
1.733	7.618
1.885	8.253
1.924	9.325
1.956	8.696
1.987	7.626
1.988	9.453
2.032	8.888
2.064	9.141
2.090	8.385
2.147	8.387
2.154	8.891
2.167	9.837
2.237	9.524
2.249	9.083
2.410	11.105
2.422	9.215
2.435	10.287
2.492	10.415
2.505	9.659
2.506	11.108
2.575	10.417
2.665	10.735
2.741	10.738
2.901	11.436
3.010	11.439
3.571	12.276
3.674	12.532];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'shell length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SiddJohn1997';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % initial length (cm), yearly length increment (cm/yr)
1.419	6.374
1.557	6.244
1.655	5.975
1.656	7.825
1.741	7.007
1.748	7.830
1.899	8.933
1.971	8.800
1.985	9.622
2.056	8.462
2.057	9.421
2.135	9.288
2.155	9.837
2.161	8.810
2.240	9.499
2.398	9.712
2.405	10.124
2.406	10.877
2.477	10.059
2.478	10.538
2.503	11.156
2.562	10.337
2.569	11.502
2.608	10.887
2.661	10.890
2.662	11.233
2.687	11.713
2.733	11.442
2.917	11.520
3.068	12.007
3.133	11.462
3.186	12.081
3.238	11.947
3.487	12.439
3.645	12.790
3.914	12.804
3.999	13.014];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'shell length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SiddJohn1997';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 10 * weights.Wwb;

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures changes seasonally, peaking at 28 C; mean of 25 C is assumed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3JDYH'; % Cat of Life
metaData.links.id_ITIS = '1048494'; % ITIS
metaData.links.id_EoL = '3049002'; % Ency of Life
metaData.links.id_Wiki = 'Haliotis_mariae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3959958'; % Taxonomicon
metaData.links.id_WoRMS = '207664'; % WoRMS
metaData.links.id_molluscabase = '207664'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Haliotis_mariae}}';
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
bibkey = 'SiddJohn1997'; type = 'Article'; bib = [ ... 
'author = {M.S.M. Siddeek and D.W. Johnson}, ' ... 
'year = {1997}, ' ...
'title = {Growth parameter estimates for {O}mani abalone (\emph{Haliotis mariae}, {W}ood 1828) using length-frequency data}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {31}, ' ...
'pages = {169-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

