function [data, auxData, metaData, txtData, weights] = mydata_Eidolon_dupreanum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Eidolon_dupreanum'; 
metaData.species_en = 'Madagascan fruit bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 131;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'EoL';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
data.tx = 4.5*31;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EoL';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 7; units.Lb = 'cm';   label.Lb = 'forewarm length at birth';     bibkey.Lb = 'AndrAndr2021';
  comment.Wwb = '13-17 percent of adult: 0.15*550';
data.Li = 12.5;  units.Li = 'cm';   label.Li = 'ultimate forewarm length'; bibkey.Li = 'AndrAndr2021';
  comment.Wwi = '500 to 645 g for females, 526 to 750 g for males';

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'EoL';
  comment.Wwb = '13-17 percent of adult: 0.15*550';
data.Wwi = 282;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'ADW';

data.Ri  = 1.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 pup per litter; 1 litter per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), forearm length (cm)
0.001	8.786
0.002	9.146
0.003	7.555
3.061	9.821
3.188	9.341
4.368	8.590
6.692	9.070
7.050	7.719
7.118	7.464
24.758	11.185
26.005	10.179
72.411	10.790
75.751	11.135
85.695	10.608
85.759	12.214
86.584	10.953
108.129	11.041
109.002	13.293
246.041	12.258
247.193	11.613
302.339	12.538
329.265	12.670];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'forearm length', 'female'};  
temp.tL_f    = C2K(34.8);  units.temp.tL_f = 'C'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AndrAndr2021';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), forearm length (cm)
0.001	7.781
0.002	7.885
3.790	7.074
4.508	8.065
5.384	8.455
5.643	9.325
6.090	9.490
6.094	7.629
7.373	6.503
21.956	10.660
22.402	10.825
22.900	12.641
48.363	10.897
72.380	10.910
75.568	11.825
85.117	10.938
86.030	13.040
86.492	11.299
109.078	14.854
109.165	14.523
109.743	12.347
109.875	11.852
109.938	13.458
109.970	11.491
110.492	13.217
110.572	12.917
111.254	12.197
111.285	12.077
138.474	13.064
139.530	12.779
195.805	13.149
246.651	11.808
247.069	12.078
328.615	11.424];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'forearm length', 'male'};  
temp.tL_m    = C2K(34.8);  units.temp.tL_m = 'C'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AndrAndr2021';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 10 * weights.Lb;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '38VDC'; % Cat of Life
metaData.links.id_ITIS = '631757'; % ITIS
metaData.links.id_EoL = '327336'; % Ency of Life
metaData.links.id_Wiki = 'Eidolon_dupreanum'; % Wikipedia
metaData.links.id_ADW = 'Eidolon_dupreanum'; % ADW
metaData.links.id_Taxo = '106641'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800096'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eidolon_dupreanum}}';
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
bibkey = 'AndrAndr2021'; type = 'Article'; bib = [ ...
'doi = {10.1101/2021.10.28.466299}, ' ...
'author = {Angelo Andrianiaina and Santino Andry and Anecia Gentles and Sarah Guth and Jean-Michel H\''{e}raud and Hafaliana Christian Ranaivoson and Ny Anjara Fifi Ravelomanantsoa and Timothy Treuer and Cara E. Brook}, ' ... 
'year = {2021}, ' ...
'title =  {Reproduction, seasonal morphology, and juvenile growth in three {M}alagasy fruit bats}, ' ...
'journal = {BioRxiv}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/327336}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


