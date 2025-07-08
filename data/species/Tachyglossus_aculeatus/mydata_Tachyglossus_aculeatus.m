function [data, auxData, metaData, txtData, weights] = mydata_Tachyglossus_aculeatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Monotremata'; 
metaData.family     = 'Tachyglossidae';
metaData.species    = 'Tachyglossus_aculeatus'; 
metaData.species_en = 'Short-beaked echidna'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTa', '0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(31.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-Ww'; 'Ww-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour';'Bas Kooijman'};    
metaData.date_subm = [2012 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2012 08 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 10 08]; 

%% set data
% zero-variate data

data.ab = 33.5;    units.ab = 'd';    label.ab = 'incubation time';           bibkey.ab = {'Rose1989','NicoAnde2007'};   
  temp.ab = C2K(31.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23 day pregnancy + 10.5 day incubation time';
data.tx = 183.3;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'NicoAnde2007';   
  temp.tx = C2K(31.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'depending on population, weaning is at 150-200 days old';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'NicoAnde2007';
  temp.tp = C2K(31.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365*50;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'NicoAnde2007';   
  temp.am = C2K(31.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '50 yrs: Zoo in Philadelphia';
  
data.Lb  = 1.3;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Grif1965';
data.Lx  = 30;   units.Lx  = 'cm';  label.Lx  = 'total length at weaning'; bibkey.Lx  = 'Grif1965';
data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Grif1965';
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Grif1965';

data.Wwb = 0.38;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'Rose1989','Grif1965'};
data.Wwx = 1500;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'SchmAnde2003';
data.Wwp = 3800;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'SchmAnde2003';
data.Wwi = 3800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'NicoAnde2007';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'NicoAnde2007';   
  temp.Ri = C2K(31.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.EL  = 2.08e5; units.EL  = 'J'; label.EL  = 'yearly milk production'; bibkey.EL  = 'CorkDove1989';   

% uni-variate data
% from NichAnde2007 (compiled growth data from other sources)
% Age (in days, including pregnancy), compared to mass (in grams)
data.tW = [39.7214	43.3811	48.5046	53.628	60.8394	60.9474	70.4625	80.3435	87.6629	88.3948	89.45805	90.40835	90.9565	92.4203	97.178	101.9355	107.425	112.1825	116.9401	120.01385	121.3317	126.8211	131.5787	133.4085	135.84	136.7022	138.14265	141.4597	141.4597	142.67485	144.57545	144.7582	144.9044	175.1284	178.6035	181.0158	187.9373	189.97055	199.5832	218.443	223.0699	226.52055	256.0895	258.5018	370.30825	378.0203	420.6376	434.70935	454.7753	472.06345	491.3984	504.7757	508.8693	509.78305	523.27	537.70725	538.80375	545.89445	601.74285	609.3818	783.25015	785.44315	790.2312	790.48705	812.746	837.0152	1177.0033	1181.6086	1275.21315	1303.8318	1556.8309	1603.35905	1639.98215	1884.86715	1912.27965	2043.64035	2051.09655	2129.09425	2138.1221	2213.342	2250.29405	2260.74735	2268.71525	2277.77965	2289.4391	2305.26525	2323.8692	2333.04325	2399.6739	2427.78085	2645.54575	2663.7111	2692.18355	2757.53495	2813.52955	2955.307	2992.62455	3029.6497	3103.22485	3309.842	3338.5703	3358.088	3442.40885	3488.24255	3779.76535	3863.5014	4117.5239	4154.91455	4229.2938	4275.2737	4294.60865	4351.4439	4417.6725	4426.8831	4484.4128	4914.0215	4959.45315; % Age (days)
        6.1743	6.2839	12.4	24.6	60.1	48.7	108.9	151.1	169.3	211.2	199.8	216.2	223.3	259.1	241.4	283.5	271.7	313.6	325.9	372.4	409.8	422	517.9	559.8	544.5	619.9	564.6	703.8	979.2	660.6	943.4	972.9	708.6	1650.9	1645.6	1632.4	1753	1753.8	1759.5	1705.2	1688.3	1681.7	1614.9	1633.6	1633.6	1633.9	1381.4	1344.2	1549.5	1489.5	1369.4	1945.9	1942.8	1362.9	1501.5	1490	2270.3	2251.4	2541.7	2546.5	1825.8	1970	1963	1799.9	2042	2054	3639.6	3633.5	3459.5	3453.1	3617.9	3872.1	4434.3	3801.6	4273.1	4237.8	5470.5	3585.7	3821.6	3713.3	4058	3369.3	4293.8	4493.2	3025	4910.4	5001.1	5146.1	4512.2	4548.7	3245.1	3625.9	3408.6	3626.6	3808.2	3120.4	3247.6	3556	4499	4337.4	3975	3485.8	3558.9	4229.9	3760.7	4214.4	3726.8	3817.6	4235.2	4815.5	4453.2	4072.9	3728.8	3855.9	3040.6	4258.1	5201.1]';% Mass (in g)
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(31.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NicoAnde2007';

% from NichAnde2007
% Weight (kg) vs mL O2 per g per hr
data.WJO = [ ...
            2.36    0.151
            3       0.217
            3.4     0.132
            3.58    0.153   
            2.73    0.174
            3.12    0.155
            2.86    0.634   % upregulation during lactation
            3.35    0.472]; % upregulation during lactation
data.WJO(:,1) = 1e3 * data.WJO(:,1);            % convert kg to g
data.WJO(:,2) = data.WJO(:,2) .* data.WJO(:,1); % convert ml O2/g.h to ml O2/h
units.WJO   = {'d', 'g O2/h'};  label.WJO = {'wet weight', 'O2 consumption'};  
temp.WJO    = C2K(31.5);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'NicoAnde2007';
%
% WIKI: body temp at hibernation is 5 C
% data.WJO_hib = [2.2     0.022];
% data.WJO_hib(:,1) = 1e3 * data.WJO_hib(:,1);            % convert kg to g
% data.WJO_hib(:,2) = data.WJO_hib(:,2) .* data.WJO_hib(:,1);  % convert ml O2/g.h to ml O2/h
% units.WJO_hib   = {'d', 'g O2/h'};  label.WJO_hib = {'wet weight', 'O2 consumption'};  
% temp.WJO_hib    = C2K(5);  units.temp.WJO_hib = 'K'; label.temp.WJO_hib = 'temperature';
% bibkey.WJO_hib = 'NicoAnde2007';

%% set weights for all real data
weights = setweights(data, []);
weights.WJO(7:8) = 0; % exclude upregulation points
weights.tW = 5 * weights.tW; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'WJO','WJO_hib'}; subtitle1 = {'Data during active period, hibernation'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Predicted milk production exceeds observed because it assumes that babies feed on milk only, while actually a gradual transition to solid food exists';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'sports torpor; said to be able to lay its egg directly in its pouch. Observed upregulation of intake and assimilation during latation';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54CMZ'; % Cat of Life
metaData.links.id_ITIS = '552522'; % ITIS
metaData.links.id_EoL = '323859'; % Ency of Life
metaData.links.id_Wiki = 'Tachyglossus_aculeatus'; % Wikipedia
metaData.links.id_ADW = 'Tachyglossus_aculeatus'; % ADW
metaData.links.id_Taxo = '105220'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10300004'; % MSW3
metaData.links.id_AnAge = 'Tachyglossus_aculeatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tachyglossus_aculeatus}}';
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
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Mucropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grif1965'; type = 'Article'; bib = [ ... 
'author = {Griffiths, M.}, ' ... 
'year = {1965}, ' ...
'title = {Rate of growth and intake of milk in a suckling echidna}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {16}, ' ...
'pages = {383--392}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NicoAnde2007'; type = 'Article'; bib = [ ... 
'author = {Nicol, S. and Andersen, N. A.}, ' ... 
'year = {2007}, ' ...
'title = {The life history of an egg-laying mammal, the echidna (\emph{Tachyglossus aculeatus})}, ' ...
'journal = {Ecoscience}, ' ...
'volume = {14}, ' ...
'pages = {275--285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rose1989'; type = 'Article'; bib = [ ... 
'author = {Rose, R. W.}, ' ... 
'year = {1989}, ' ...
'title = {Embryonic growth rates of marsupials with a note on monotremes}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {218}, ' ...
'pages = {11-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchmAnde2003'; type = 'Article'; bib = [ ... 
'author = {Schmid, J. and Aandersen, N. A. and Speakman, J. R. and Nicol, S.}, ' ... 
'year = {2003}, ' ...
'title = {Field energetics of free-living, lactating and non-lactating echidnas (\emph{Tachyglossus aculeatus})}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A}, ' ...
'volume = {136}, ' ...
'pages = {903-909}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Semo1984'; type = 'Article'; bib = [ ... 
'author = {Semon, R.}, ' ... 
'year = {1984}, ' ...
'title = {Zur Entwicklungsgeschichte der Monotremen}, ' ...
'journal = {Zoologische Forschungsreisen in Australien}, ' ...
'volume = {2}, ' ...
'pages = {61--74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

