function [data, auxData, metaData, txtData, weights] = mydata_Latimeria_chalumnae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Sarcopterygii'; 
metaData.order      = 'Coelacanthiformes'; 
metaData.family     = 'Latimeriidae';
metaData.species    = 'Latimeria_chalumnae'; 
metaData.species_en = 'Coelacanth'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];

%% set data
% zero-variate data

data.ab = 14 * 30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Wiki';   
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'All temperatures are guessed; FroeLour2000: ab = 3 yr';
data.ap = 16 * 365;  units.ap = 'd';    label.ap = 'age at puberty';             bibkey.ap = 'FroeLour2000';
  temp.ap = C2K(14); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Wiki: 20 yr';
data.am = 48 * 365;  units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 36;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';         bibkey.Lb  = 'Smithonian';  
data.Lp  = 150;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';       bibkey.Lp  = 'Smithonian'; 
data.Li  = 199;  units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'FroeLour2000';
data.Lim = 168;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'FroeLour2000';

data.Wwi = 80000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';

data.Ri  = 17.5/(14*30.5); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki 5-25 per clutch, assumed interval: ab';
 
% uni-variate data
% t-L data from FroeLour2000
data.tL = [ ... % time since birth (yr), bofy length (cm)
-0.04	    31.404
0.098	43.032
5.784	83.414
6.176	89.678
10.196	120.179
10.490	125.546
12.255	133.645
12.353	125.613
15.980	140.028
17.745	153.484
18.333	160.648
20.392	180.364];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FroeLour2000';
  
% L-W data
data.LW = [ ... % log length (cm), log weight (g)
1.6268	2.9098
1.8456	3.9862
1.9020	4.1755
1.9298	3.9669
1.9368	3.9826
1.9527	4.0139
1.9616	4.1890
2.0001	4.1077
2.0127	4.3625
2.0300	4.1544
2.0357	4.5371
2.0389	4.2338
2.0390	4.3136
2.0391	4.3934
2.0391	4.4572
2.0727	4.6314
2.0777	4.4238
2.0796	4.5354
2.0864	4.3436
2.0935	4.4391
2.0956	4.7422
2.1022	4.3749
2.1024	4.5345
2.1130	4.5819
2.1163	4.3903
2.1164	4.4701
2.1269	4.4697
2.1270	4.5973
2.1322	4.5492
2.1392	4.4851
2.1410	4.5808
2.1465	4.7721
2.1534	4.6122
2.1553	4.7717
2.1620	4.5321
2.1623	4.7714
2.1692	4.6435
2.1763	4.7071
2.1904	4.7863
2.1971	4.5307
2.2062	4.7697
2.2063	4.9133
2.2131	4.6577
2.2185	4.7692
2.2186	4.8809
2.2432	4.8959
2.2555	4.9592];
data.LW = 10 .^ data.LW; % take anti-log to convert to cm, g
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'FroeLour2000';

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


%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Adult females slightly larger than males; ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P2SC'; % Cat of Life
metaData.links.id_ITIS = '649768'; % ITIS
metaData.links.id_EoL = '46582216'; % Ency of Life
metaData.links.id_Wiki = 'Latimeria_chalumnae'; % Wikipedia
metaData.links.id_ADW = 'Latimeria_chalumnae'; % ADW
metaData.links.id_Taxo = '42378'; % Taxonomicon
metaData.links.id_WoRMS = '217438'; % WoRMS
metaData.links.id_fishbase = 'Latimeria-chalumnae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Latimeria_chalumnae}}';
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
bibkey = 'FroeLour2000'; type = 'Article'; bib = [ ... 
'author = {R. Froese and M. Lourdes  and D. Palomares}, ' ... 
'year = {2000}, ' ...
'title = {Growth, natural mortality, length-weight relationship, maximum length and length-at-first-maturity of the coelacanth \emph{Latimeria chalumnae}}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {58}, ' ...
'pages = {45-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Latimeria_chalumnae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smithonian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.mnh.si.edu/highlight/coelacanth/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

