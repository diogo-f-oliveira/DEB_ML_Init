function [data, auxData, metaData, txtData, weights] = mydata_Chimaera_fulva
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Chimaeridae';
metaData.species    = 'Chimaera_fulva'; 
metaData.species_en = 'Southern chimaera'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.4); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 27]; 

%% set data
% zero-variate data;
data.tp = 18*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Bell2012';   
  temp.tp = C2K(5.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 13*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Bell2012';   
  temp.tpm = C2K(5.4); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bell2012';   
  temp.am = C2K(5.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 16;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Chimaera_monstrosa';
data.Lp = 62.8;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females';bibkey.Lp  = 'Bell2012';
data.Lpm = 50.8; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Bell2012';
data.Li  = 100;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi  = 4.9e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.10, see F3';

data.Ri  = 22/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Bell2012';   
  temp.Ri = C2K(5.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'enlarged ovarian oocytes at TL 75 cm';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
4.821	21.484
5.725	26.877
9.944	32.499
12.881	42.753
14.915	67.614
15.970	66.179
15.970	64.361
16.874	65.663
16.874	74.753
17.778	66.055
18.983	63.246
19.962	69.088
19.962	64.088
20.866	77.209
20.866	67.663
20.866	64.936
20.866	64.027
20.866	62.663
21.017	59.926
21.846	61.687
21.921	66.682
21.921	76.682
21.921	78.046
21.996	70.768
22.750	72.989
22.900	61.161
22.976	68.428
23.804	55.645
23.804	62.008
23.804	69.281
23.879	65.639
24.934	65.568
24.934	71.022
25.763	74.147
25.763	76.420
25.913	70.501
25.913	67.773
25.913	65.955
27.043	74.060
27.797	67.191
27.797	75.827
27.872	72.640
28.023	78.993
28.927	70.295
28.927	76.204
29.906	79.774
29.906	70.229
29.906	62.956
30.885	81.071
31.036	63.333
31.111	70.601
31.940	65.090
32.090	78.716
32.844	68.665
32.844	66.392
32.844	81.846
33.974	66.769
34.953	80.339
36.083	79.807];
data.tL(:,1) = data.tL(:,1)*365; % % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(11.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bell2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00309 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XS9F'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46561109'; % Ency of Life
metaData.links.id_Wiki = 'Chimaera_fulva'; % Wikipedia
metaData.links.id_ADW = 'Chimaera_fulva'; % ADW
metaData.links.id_Taxo = '1683985'; % Taxonomicon
metaData.links.id_WoRMS = '398336'; % WoRMS
metaData.links.id_fishbase = 'Chimaera-fulva'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chimaera_fulva}}';  
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
bibkey = 'Bell2012'; type = 'phdthesis'; bib = [ ... 
'author = {Justin David Bell}, ' ...
'year = {2012}, ' ...
'title  = {Reproduction and ageing of Australian holocephalans and white-fin swell shark}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chimaera-fulva.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

