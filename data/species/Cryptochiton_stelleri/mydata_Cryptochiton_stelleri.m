function [data, auxData, metaData, txtData, weights] = mydata_Cryptochiton_stelleri

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Polyplacophora'; 
metaData.order      = 'Chitonida'; 
metaData.family     = 'Acanthochitonidae';
metaData.species    = 'Cryptochiton_stelleri'; 
metaData.species_en = 'Gymboot chiton'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 21]; 

%% set data
% zero-variate data

data.am = 34*365; units.am = 'd';    label.am = 'life span';           bibkey.am = 'Lord2012';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'in view of growth at 12 yr, life span is likely to be underestimated';

data.Lp  = 8.125;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Lepidochitona_cinerea: 0.6*32.5/2.4)'; 
data.Li  = 32.5;   units.Li  = 'cm';  label.Li  = 'ultimate length'; bibkey.Li  = 'sealifebase';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 160-200 mum for Lepidochitona_cinerea:  pi/6*0.02^3';
data.Wwj = 4.3e-6;  units.Wwj = 'g'; label.Wwj = 'wet weight at birth'; bibkey.Wwj = 'guess';
  comment.Wwj = 'Based on settlement following a few hours after hatching';

data.Ri  = 2.2e7/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for yearly fecundity of Lepidochitona_cinerea: (32.5/1.4)^3*1.8e3';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), length (cm)
0.662	3.037
0.927	3.796
3.974	9.781
8.079	17.114
9.007	19.390
16.954	30.766
18.079	30.004
20.000	27.890
20.927	27.466
20.993	28.310
21.987	32.443
23.046	28.053
23.046	31.766
23.046	32.947
23.046	33.453
24.040	34.970
24.106	33.367
25.033	33.534
26.026	32.941
26.954	32.348
28.013	34.118
28.013	34.709
28.940	33.610
31.987	37.232
32.053	36.472
33.974	35.878];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Lord2012';
comment.tL = 'based in circumference when curled up in a bal; Lord2012 actually specifies mm, but the assumption is that this must be cm';

% time-weight data
data.tWw = [ ... % time since birth (yr), volume (ml)
0.596	5.959
4.104	38.257
8.139	135.633
8.931	191.811
16.992	581.913
17.988	537.442
19.979	445.539
20.973	430.667
21.033	572.734
21.889	667.385
22.945	732.424
23.016	643.623
23.093	421.630
24.001	827.060
24.136	756.014
25.057	889.138
26.055	794.350
26.918	758.768
27.973	853.405
27.977	773.489
28.973	714.219
29.034	811.888
31.936	1078.059
32.138	992.208
34.058	1003.906];
data.tWw(:,1) = data.tWw(:,1)*365; % convert yr to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(16);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Lord2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'A plaktonic stage of only a few hours is assumed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'No sexual dimorphism';
metaData.bibkey.F1 = 'Lord2012';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZWHP'; % Cat of Life
metaData.links.id_ITIS = '79032'; % ITIS
metaData.links.id_EoL = '403806'; % Ency of Life
metaData.links.id_Wiki = 'Cryptochiton_stelleri'; % Wikipedia
metaData.links.id_ADW = 'Cryptochiton_stelleri'; % ADW
metaData.links.id_Taxo = '34557'; % Taxonomicon
metaData.links.id_WoRMS = '240776'; % WoRMS
metaData.links.id_molluscabase = '240776'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cryptochiton_stelleri}}';
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
bibkey = 'Lord2012'; type = 'Article'; bib = [ ...
'doi = {10.4002/040.055.0104}, ' ...
'author = {Joshua P. Lord}, ' ... 
'year = {2012}, ' ...
'title = {Longevity and growth rates of the gumboot chiton \emph{Cryptochiton stelleri}, and the black leather chiton, \emph{Katharina tunicata}}}, ' ...
'journal = {Malacologia}, ' ...
'volume = {55}, ' ...
'number = {1}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Cryptochiton-stelleri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

